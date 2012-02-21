(require 'filecache)
(add-to-list 'file-cache-filter-regexps "/[.]git")
(add-to-list 'file-cache-filter-regexps "/[.]svn")
(add-to-list 'file-cache-filter-regexps "\\.beam$")


(file-cache-add-directory-using-find "~/devel/zotonic")
(file-cache-add-directory-using-find "~/devel/Project-X/projectx")
;;(file-cache-add-directory-using-find "~/devel/goldrepublic")




(defun file-cache-ido-find-file (file)
  "Using ido, interactively open file from file cache'.
First select a file, matched using ido-switch-buffer against the contents
in `file-cache-alist'. If the file exist in more than one
directory, select directory. Lastly the file is opened."
  (interactive (list (file-cache-ido-read "File-cache file: "
                                          (mapcar
                                           (lambda (x)
                                             (car x))
                                           file-cache-alist))))
  (let* ((record (assoc file file-cache-alist)))
    (find-file
     (expand-file-name
      file
      (if (= (length record) 2)
          (car (cdr record))
        (file-cache-ido-read
         (format "Find %s in dir: " file) (cdr record)))))))

(defun file-cache-ido-read (prompt choices)
  (let ((ido-make-buffer-list-hook
	 (lambda ()
	   (setq ido-temp-list choices))))
    (ido-read-buffer prompt)))


(global-set-key "\C-x\C-a" 'file-cache-ido-find-file)

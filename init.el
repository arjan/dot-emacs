;;; init.el --- Emacs Prelude: configuration entry point.
;;
;; Copyright (c) 2011 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar.batsov@gmail.com>
;; URL: http://www.emacswiki.org/cgi-bin/wiki/Prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file simply sets up the default load path and requires
;; the various modules defined within Emacs Prelude.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;; On OS X Emacs doesn't use the shell PATH if it's not started from
;; the shell. If you're using homebrew modifying the PATH is essential.
(if (eq system-type 'darwin)
    (push "/usr/local/bin" exec-path))

(defvar prelude-dir (file-name-directory load-file-name)
  "The root dir of the Emacs Prelude distribution.")
(defvar prelude-modules-dir (concat prelude-dir "modules/")
  "This directory houses all of the built-in Prelude module. You should
avoid modifying the configuration there.")
(defvar prelude-vendor-dir (concat prelude-dir "vendor/")
  "This directory house Emacs Lisp packages that are not yet available in
ELPA (or Marmalade).")
(defvar prelude-personal-dir (concat prelude-dir "personal/")
  "Users of Emacs Prelude are encouraged to keep their personal configuration
changes in this directory. All Emacs Lisp files there are loaded automatically
by Prelude.")

(add-to-list 'load-path prelude-modules-dir)
(add-to-list 'load-path prelude-vendor-dir)
(add-to-list 'load-path prelude-personal-dir)

;; config changes made through the customize UI will be store here
(setq custom-file (concat prelude-personal-dir "custom.el"))

;; the core stuff
(require 'prelude-ui)
(require 'prelude-packages)
(require 'prelude-el-get)
(require 'prelude-core)
(require 'prelude-editor)
(require 'prelude-global-keybindings)

;; programming & markup languages support
(require 'prelude-c)
(require 'prelude-clojure)
(require 'prelude-coffee)
(require 'prelude-common-lisp)
(require 'prelude-emacs-lisp)
(require 'prelude-erc)
(require 'prelude-haskell)
(require 'prelude-js)
(require 'prelude-latex)
(require 'prelude-markdown)
(require 'prelude-org)
(require 'prelude-perl)
(require 'prelude-python)
(require 'prelude-ruby)
(require 'prelude-scheme)
(require 'prelude-xml)

;; load the personal settings (this includes `custom-file')
(when (file-exists-p prelude-personal-dir)
  (mapc 'load (directory-files prelude-personal-dir nil "^[^#].*el$")))

;;; init.el ends here

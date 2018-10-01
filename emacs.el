
;;; FUNCTIONS

;; Add MELPA to package source list
(defun add-melpa-to-package-list ()
  "Adds melpa to package source list"
  (require 'package)
  (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                      (not (gnutls-available-p))))
	 (proto (if no-ssl "http" "https")))
    ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
    (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
    ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
    (when (< emacs-major-version 24)
      ;; For important compatibility libraries like cl-lib
      (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
  )

;;; CONFIGURATION

;; Enable package support
(add-melpa-to-package-list)
(package-initialize)

;; Enable auto completion
;;; Auto complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;;; Snippets
(require 'yasnippet)
(yas-global-mode 1)

;;; Clang format
(require 'clang-format)
(define-key global-map (kbd "C-c i") 'clang-format-region)
(define-key global-map (kbd "C-c u") 'clang-format-buffer)

;;; C/C++ config
(defun my:c-cpp-init ()
  (c-set-style "linux")
  )
(add-hook 'c-mode-hook 'my:c-cpp-init)
(add-hook 'c++-mode-hook 'my:c-cpp-init)

;; Enable moving with shift through buffers
(require 'windmove)
(windmove-default-keybindings)

;; No more M-x "query-replace-regexp"
(substitute-key-definition 'delete-indentation
			   'query-replace-regexp
			   (current-global-map))

;; Eval-region for M-:
(substitute-key-definition 'eval-expression
                           'eval-region
                           (current-global-map))

;; Set Theme
(require 'zenburn-theme)
(load-theme 'zenburn t nil)

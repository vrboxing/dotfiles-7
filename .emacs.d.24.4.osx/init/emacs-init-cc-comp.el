; =======================================
;; Programming Environment for /C C++/
(require 'cc-mode)
;; Warning: semantic-mode in CEDET causes "M-x gdb" hangs emacs in Mac OS X!
(if (string-equal system-type "darwin")
    (progn 
    (setq y-enable-function-args-flag "no")
    (setq y-enable-cedet-source-info "no"))
  (setq y-enable-function-args-flag "yes")
  (setq y-enable-cedet-source-info "yes"))


;; Package: /google-c-style/
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;; Editing Configurations (having set in /google-c-style/)
    ;(setq-default c-default-style "linux")
    ;(setq-default c-basic-offset 4)
    ;(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)


;; Package: /smartparens/
;; having enable globally in .emacs
;; if not using /smartparens/ globally, uncomment the next line
;(require 'smartparens)
;; when you press RET, the curly braces automatically add another newline
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '(("| " "SPC") ("* ||\n[i]" "RET"))))


;; Package: /iedit/; default key "C-c ;"
(require 'iedit)


;; /flymake-google-cpplint/ (having built-in /flymake-cursor/ functionality)
; let's define a function for flymake initialization
(defun y:flymake-google-init () 
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command
     (if (string-equal system-type "darwin") "/usr/local/bin/cpplint"
       "/usr/bin/cpplint")))
  (flymake-google-cpplint-load))
;(add-hook 'c-mode-hook 'y:flymake-google-init)
(add-hook 'c++-mode-hook 'y:flymake-google-init)


;; /xcscope/: source cross-referencing tool [need to install cscope]
;; (add-to-list 'load-path "~/.emacs.d/git/xcscope")
;(require 'xcscope)
;(cscope-setup)


;; configure /company-mode/ for C/C++ sources and headers
;; use /clang/ and /company-c-headers/
(require 'company-c-headers)
(add-to-list 'company-c-headers-path-system "/usr/local/include/c++/6.1.0/")
;; (add-to-list 'company-backends '(company-c-headers company-clang))
(defun y:company-cpp-setup ()
  (setq-local company-backends
              (append '((company-c-headers company-clang))
                      company-backends)))
(add-hook 'c-mode-common-hook 'y:company-cpp-setup)


;; Package: /GNU global/ + /helm-gtags/ to support tags
(load (concat y-init-path-prefix "emacs-init-cc-tags"))


;; Package: /CEDET (part)/
;; - usage: source code information
(cond ((string-equal y-enable-cedet-source-info "yes")
       ;; enable /semantic-mode/
       (require 'semantic)
       (global-semantic-idle-scheduler-mode 1)
       (global-semanticdb-minor-mode 1)
       ;; setting include paths
       (semantic-add-system-include "/usr/local/include/c++" 'c++-mode)
       (semantic-add-system-include "/usr/local/include/c" 'c-mode)
       ;(add-hook 'c++-mode-hook
       ;          (add-hook 'semantic-init-hooks 'semantic-reset-system-include))
       ;; display function interface in the minibuffer
       (global-semantic-idle-summary-mode 1)
       ;; show the function at the first line of the current buffer
       (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
       (require 'stickyfunc-enhance)
       ))

;; Package: /function-args/
;; - keybinding: fa-show =C-c M-i=; moo-complete =C-c M-o=
(cond ((string-equal y-enable-function-args-flag "yes")
       (require 'function-args)
       ;; enable case-insensitive searching
       (set-default 'semantic-case-fold t)
       ;; set selection interface
       (setq moo-select-method 'ivy)  ;; ivy, helm, helm-fuzzy
       ;; enable function-args
       (add-hook 'c-mode-hook 'fa-config-default)
       (add-hook 'c++-mode-hook 'fa-config-default)
       ;; put c++-mode as default for .h files
       ;(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
       ;; keybindings
       ;; the source file of /function-args/ has been modified (disable keybindings of "M-o" and "M-i"), so as to keep the original:
       ;; "M-o" :: =open-previous-line=
       ;; "M-i" :: =tab-to=tab-stop=
       (define-key c-mode-map   (kbd "C-c M-o")  'moo-complete)
       (define-key c++-mode-map (kbd "C-c M-o")  'moo-complete)
       (define-key c-mode-map   (kbd "C-c M-i")  'fa-show)
       (define-key c++-mode-map (kbd "C-c M-i")  'fa-show)
       ))

;; -------------------------------------------
;; Enable major modes for CMake files
;; /cmake-mode/: cmake-mode.el
(require 'cmake-mode)
;; /cmake-font-lock/: to add more fontifying features
(add-to-list 'load-path "~/.emacs.d/git/cmake-font-lock")
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

;; -------------------------------------------
;; ;; use /doxymacs/ to manipulate doxygen documentations
;; (add-to-list 'load-path "~/.emacs.d/git/doxymacs-1.8.0")
;; (require 'doxymacs)
;; (add-hook 'c-mode-common-hook 'doxymacs-mode)
;; ; fontify the doxygen keywords
;; (defun my-doxymacs-font-lock-hook ()
;;   (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
;;       (doxymacs-font-lock)))
;; (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

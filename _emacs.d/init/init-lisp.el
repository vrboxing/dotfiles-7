;; ================================================================
;; Programming Environment for /Lisp/
;; ================================================================
;; use "C-j" in *scratch*; output is in the buffer under the sexp
;; use "C-h e" to open *Message* buffer for elisp printout
;; use "M-:" to evaluate elisp in mini-buffer
;; use "M-x ielm" to open interactive shell

;; To make "C-x C-e" use pretty-print; output is shown in minibuffer
(global-set-key [remap eval-last-sexp] 'pp-eval-last-sexp)
;; Keybindings for eval expressions (default: "C-x C-e" eval last S-expr)
(define-key emacs-lisp-mode-map (kbd "C-c C-j") 'eval-last-sexp)
(define-key emacs-lisp-mode-map (kbd "C-c C-r") 'eval-region)
(define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-buffer)
(define-key emacs-lisp-mode-map (kbd "C-c C-f") 'eval-defun)

;; /ParEdit/ mode   (replaced by /smartparens/)
;; (autoload 'enable-paredit-mode "paredit"
;;   "Turn on pseudo-structural editing of Lisp code." t)
;; (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)

;; /smartparens/ mode (enabled in =init-basics.el=)
(define-key smartparens-mode-map (kbd "M-S") 'sp-split-sexp)
(define-key smartparens-mode-map (kbd "M-J") 'sp-join-sexp)
(define-key smartparens-mode-map (kbd "M-R") 'sp-raise-sexp)
;; basic usages:
;; + ~forward-sexp~, =C-M-f=:
;;     move forward over a balanced expression that can be a pair or a symbol
;; + ~backward-sexp~, =C-M-b=:
;;   move backward
;; + ~kill-sexp~, =C-M-k=:
;;   kill balaced expression forward that can be a pair or a symbol
;; + ~mark-sexp~, =C-M-<SPC>= or =C-M-@=:
;;   put mark after following expression that can be a pair or a symbol
;; + ~beginning-of-defun~, =C-M-a=:
;;   move point to beginning of a function
;; + ~end-of-defun~, =C-M-e=:
;;   move point to end of a function
;; + ~mark-defun~, =C-M-h=:
;;   put a region around whole current or following function

;; MIT/GNU /Scheme/
(setq scheme-program-name "/usr/local/bin/mit-scheme")
(require 'xscheme)
;; Usage:
;;  - "M-x run-scheme" to invoke the Scheme process
;;  - "M-o" to send the buffer to the Scheme process



(provide 'init-lisp)
;; ================================================
;; init-lisp.el ends here

;; ===============================================================
;; Ivy - a generic completion mechanism for Emacs
;; ===============================================================
;; Last modified on 31 Mar 2018


;; Install required Emacs packages
(setq custom/ivy-ext-packages
      '(ivy
        counsel
        swiper
        counsel-projectile
        counsel-gtags))
(custom/install-packages custom/ivy-ext-packages)

;; ---------------------------------------------
;; /Ivy + Counsel + Swiper/: by abo-abo
;; ---------------------------------------------

;; Configurations
(ivy-mode 1)
(setq ivy-height 15)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-use-selectable-prompt t)  ;; make inputs selectable

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> k") 'counsel-descbinds)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "M-g SPC") 'counsel-mark-ring)  ;; M-SPC used by Alfred
(global-set-key (kbd "C-c i") 'counsel-semantic-or-imenu)

(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
;; alternative ~swiper~ for very large files (one may use to replace =C-s=)
(global-set-key (kbd "M-g s") 'counsel-grep-or-swiper)
(setq counsel-grep-base-command
 "rg -i -M 120 --no-heading --line-number --color never '%s' %s")
(global-set-key (kbd "M-g a") 'counsel-ag)    ;; C-c k
(global-set-key (kbd "M-g k") 'counsel-ack)
(global-set-key (kbd "M-g r") 'counsel-rg)    ;; large files
(global-set-key (kbd "M-g f") 'counsel-fzf)   ;; helm-find
;; (global-set-key (kbd "C-x l") 'counsel-locate)

(define-key minibuffer-local-map (kbd "C-r")
  'counsel-minibuffer-history)
;; helm-like actions
(require 'counsel)
(define-key ivy-switch-buffer-map (kbd "C-o")
  'counsel-recentf)

;; ---------------------------------------------
;; /counsel-projectile/: Ivy for projectile
;; ---------------------------------------------
(counsel-projectile-mode)

;; ---------------------------------------------
;; /counsel-gtags/: Ivy for gtags (GNU global)
;; ---------------------------------------------
(add-hook 'c-mode-hook 'counsel-gtags-mode)
(add-hook 'c++-mode-hook 'counsel-gtags-mode)
(add-hook 'python-mode-hook 'counsel-gtags-mode)

(with-eval-after-load 'counsel-gtags
  ;; basic jumps
  (define-key counsel-gtags-mode-map (kbd "M-.") 'counsel-gtags-dwim)
  (define-key counsel-gtags-mode-map (kbd "M-,") 'counsel-gtags-go-backward)
  (define-key counsel-gtags-mode-map (kbd "M-t") 'counsel-gtags-find-definition)
  (define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
  (define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
  ;; create/update tags
  (define-key counsel-gtags-mode-map (kbd "C-c g c") 'counsel-gtags-create-tags)
  (define-key counsel-gtags-mode-map (kbd "C-c g u") 'counsel-gtags-update-tags)
  ;; jump over stacks/history
  (define-key counsel-gtags-mode-map (kbd "C-c g [") 'counsel-gtags-go-backward)
  (define-key counsel-gtags-mode-map (kbd "C-c g ]") 'counsel-gtags-go-forward))

(provide 'init-ivy)
;; ================================================
;; init-ivy.el ends here

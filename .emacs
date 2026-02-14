(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq custom-file "/home/bruno/.emacs.custom.el")
(load-file custom-file)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(global-visual-line-mode t)
(display-line-numbers-mode t)

(setq make-backup-file nil)

(setq inhibit-startup-screen t)

(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'ido)
(ido-mode 1)
(ido-everywhere 1)

(require 'magit)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(with-eval-after-load 'dired
  ;; Bind dired-x-find-file.
  (require 'dired-x)
  (setq dired-x-hands-off-my-keys nil)
  )
(add-hook 'dired-mode-hook 'dired-omit-mode)

(require 'move-text)
(move-text-default-bindings)

(require 'auto-complete)
;; fix auto-complete
(ac-config-default)
(add-hook 'auto-complete-mode-hook (lambda () (setq ac-sources (remove 'ac-source-abbrev ac-sources))))

(cua-mode t)
;;(setq cua-auto-tabify-rectangles nil)
;;(transient-mark-mode 1)
(setq cua-keep-region-after-copy t)

(setq org-replace-disputed-keys t)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(require 'autothemer)

(use-package github-light
  :ensure t
  :config
  (load-theme 'github-light t)
  )

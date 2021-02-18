(load "~/.emacs.d/sanemacs.el" nil t)

;; Enable Evil mode
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

;;;; Org mode configuration
;; Enable Org mode
(require 'org)

;; Use helm to complete M-x commands
(global-set-key (kbd "M-x") 'helm-M-x)

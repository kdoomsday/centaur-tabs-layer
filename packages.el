;;; packages.el --- centaur-tabs layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Eduardo <doomsday@eduardo-pc>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `centaur-tabs-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `centaur-tabs/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `centaur-tabs/pre-init-PACKAGE' and/or
;;   `centaur-tabs/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst centaur-tabs-packages
  '(centaur-tabs)
  "The list of Lisp packages required by the centaur-tabs layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun centaur-tabs/init-centaur-tabs ()
  "Initialize centaur-tabs layer."
  (use-package centaur-tabs
    :demand
    :config
    ;; (centaur-tabs-mode t)
    (setq centaur-tabs-height 32)
    (setq centaur-tabs-set-icons t)
    (setq centaur-tabs-set-modified-marker t)
    (setq centaur-tabs-modified-marker "⚠")
    (setq centaur-tabs-style "bar")
    (setq centaur-tabs-set-bar 'over)
    (setq centaur-tabs-cycle-scope 'tabs)
    (centaur-tabs-group-by-projectile-project)
    (define-key evil-normal-state-map (kbd "C-.") nil)
    (define-key evil-motion-state-map (kbd "C-,") 'centaur-switch-tab)
    (define-key evil-motion-state-map (kbd "C-.") 'centaur-switch-tab)
    (define-key evil-insert-state-map (kbd "C-,") 'centaur-switch-tab)
    (define-key evil-insert-state-map (kbd "C-.") 'centaur-switch-tab)
    (define-key evil-motion-state-map (kbd "<C-left>") 'centaur-switch-tab)
    (define-key evil-motion-state-map (kbd "<C-right>") 'centaur-switch-tab)
    (define-key evil-motion-state-map (kbd "<C-up>") 'centaur-switch-tab)
    (define-key evil-motion-state-map (kbd "<C-down>") 'centaur-switch-tab)))
    ;; :bind
    ;; (:map evil-motion-state-map
	  ;;       ("C-." . centaur-tabs-forward)
	  ;;       ("C-," . centaur-tabs-backward))
    ;; (:map evil-normal-state-map
	  ;;       ("C-." . centaur-tabs-forward)
	  ;;       ("C-," . centaur-tabs-backward))))


;;; packages.el ends here

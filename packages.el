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
    (setq dotspacemacs-distinguish-gui-tab t)
    (global-undo-tree-mode)
    (centaur-tabs-mode t)
    (centaur-tabs-local-mode t) ; not really necessary but it provides a nice
                                ; 'Emacs is ready' indication
    (setq centaur-tabs-height 32)
    (setq centaur-tabs-set-icons t)
    (setq centaur-tabs-set-modified-marker t)
    (setq centaur-tabs-modified-marker "⚠")
    (setq centaur-tabs-style "bar")
    (setq centaur-tabs-set-bar 'over)
    (setq centaur-tabs-cycle-scope 'tabs)
    ;; (centaur-tabs-group-by-projectile-project)
    (centaur-tabs-group-buffer-groups)
    :bind
    (:map evil-motion-state-map
          ("C-," . centaur-tabs-backward-and-hide)
          ("C-." . centaur-tabs-forward-and-hide)
          ("C-m" . centaur-tabs-counsel-switch-group)
          ("<C-up>" . centaur-tabs-backward-group-and-hide)
          ("<C-down>" . centaur-tabs-forward-group-and-hide)
          ("RET" . evil-ret)
          ("C-/" . centaur-tabs-forward-group-and-hide))
    (:map evil-normal-state-map
          ("C-," . centaur-tabs-backward-and-hide)
          ("C-." . centaur-tabs-forward-and-hide)
          ("C-m" . centaur-tabs-counsel-switch-group)
          ("<C-up>" . centaur-tabs-backward-group-and-hide)
          ("<C-down>" . centaur-tabs-forward-group-and-hide)
          ("RET" . evil-ret)
          ("C-/" . centaur-tabs-forward-group-and-hide))
    (:map evil-insert-state-map
          ("C-," . centaur-tabs-backward-and-hide)
          ("C-." . centaur-tabs-forward-and-hide)
          ("C-m" . centaur-tabs-counsel-switch-group)
          ("<C-up>" . centaur-tabs-backward-group-and-hide)
          ("<C-down>" . centaur-tabs-forward-group-and-hide)
          ("RET" . evil-ret)
          ("C-/" . centaur-tabs-forward-group-and-hide))
    (:map evil-evilified-state-map-original
          ("C-," . centaur-tabs-backward-and-hide)
          ("C-." . centaur-tabs-forward-and-hide)
          ("C-m" . centaur-tabs-counsel-switch-group)
          ("<C-up>" . centaur-tabs-backward-group-and-hide)
          ("<C-down>" . centaur-tabs-forward-group-and-hide)
          ("RET" . evil-ret)
          ("C-/" . centaur-tabs-forward-group-and-hide))
    ))

(defun centaur-tabs/post-init-centaur-tabs ()
"This post-init function fixes undo-tree mode not getting enabled.
Rebinding 'C-/' prevents undo-tree-mode from getting enabled. So
here we remove the 'rebinding check' from the original
`turn-on-undo-tree-mode' function. Its docstring is still the
original however."

  (defun turn-on-undo-tree-mode (&optional print-message)
    "Enable `undo-tree-mode' in the current buffer, when appropriate.
Some major modes implement their own undo system, which should
not normally be overridden by `undo-tree-mode'. This command does
not enable `undo-tree-mode' in such buffers. If you want to force
`undo-tree-mode' to be enabled regardless, use (undo-tree-mode 1)
instead.

The heuristic used to detect major modes in which
`undo-tree-mode' should not be used is to check whether either
the `undo' command has been remapped, or the default undo
keybindings (C-/ and C-_) have been overridden somewhere other
than in the global map. In addition, `undo-tree-mode' will not be
enabled if the buffer's `major-mode' appears in
`undo-tree-incompatible-major-modes'."
    (interactive "p")
    (if (or (key-binding [remap undo])
	          (memq major-mode undo-tree-incompatible-major-modes))
        (when print-message
	        (message "Buffer does not support undo-tree-mode;\
 undo-tree-mode NOT enabled"))
      (undo-tree-mode 1))))

;;; packages.el ends here

(defun tabs-timer-initialize (secs)
  (setq tabs-timer (run-with-timer secs nil (lambda () (centaur-tabs-local-mode 1)))))

(tabs-timer-initialize 3)

(add-hook 'window-setup-hook 'tabs-timer-initialize)

(defun centaur-tabs-switch-and-hide (arg)
  (cancel-timer tabs-timer)
  (centaur-tabs-local-mode 1)
  ;; (if arg
  ;;     (centaur-tabs-backward)
  ;;   (centaur-tabs-forward))
  (cond ((equal arg 'backward)
         (centaur-tabs-backward))
        ((equal arg 'forward)
         (centaur-tabs-forward))
        ((equal arg 'backward-group)
         (centaur-tabs-backward-group))
        ((equal arg 'forward-group)
         (centaur-tabs-forward-group)))
  (centaur-tabs-local-mode 0)
  (setq tabs-timer (tabs-timer-initialize 2)))

(defun centaur-tabs-forward-and-hide ()
  (interactive)
  (centaur-tabs-switch-and-hide 'forward))

(defun centaur-tabs-backward-and-hide ()
  (interactive)
  (centaur-tabs-switch-and-hide 'backward))

(defun centaur-tabs-forward-group-and-hide ()
  (interactive)
  (centaur-tabs-switch-and-hide 'forward-group))

(defun centaur-tabs-backward-group-and-hide ()
  (interactive)
  (centaur-tabs-switch-and-hide 'backward-group))

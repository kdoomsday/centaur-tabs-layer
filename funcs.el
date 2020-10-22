(defun tabs-timer-initialize ()
  (setq tabs-timer (run-with-timer 3 nil (lambda () (centaur-tabs-local-mode 1)))))

(add-hook 'window-setup-hook 'tabs-timer-initialize)

(defun centaur-tabs-switch-and-hide (arg)
  (cancel-timer tabs-timer)
  (centaur-tabs-local-mode 1)
  (if arg
      (centaur-tabs-backward)
    (centaur-tabs-forward))
  (centaur-tabs-local-mode 0)
  (setq tabs-timer (run-with-timer 2 nil (lambda () (centaur-tabs-local-mode 1)))))

(defun centaur-tabs-forward-and-hide ()
  (interactive)
  (centaur-tabs-switch-and-hide nil))

(defun centaur-tabs-backward-and-hide ()
  (interactive)
  (centaur-tabs-switch-and-hide t))

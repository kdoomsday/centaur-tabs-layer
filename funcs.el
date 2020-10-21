;; thanks to Daniel Nicolai
(defun centaur-switch-tab ()
  (interactive)
  (centaur-tabs-mode 1)
  (let ((continue t))
    (while continue
      (setq continue
            (with-timeout (3 nil)
              (let ((event (read-event)))
                (cond ((string= (single-key-description event) "C-,")
                       (centaur-tabs-backward))
                      ((string= (single-key-description event) "C-.")
                       (centaur-tabs-forward)))))))
    (centaur-tabs-mode 0)))

;; thanks to Daniel Nicolai
(defun centaur-switch-tab ()
  "Activate centaur-tabs-mode, switch and deactivate mode.
This function really is a hack (a workaround because Emacs does
not detect key release events), as the keybindings are set within
this function. And additionally the same keybindings are bound
globally to this function (see the keybindings following the code
of this function. Pressing one of the keybindings first activates
centaur-tabs-mode (i.e. the tabs are shown). Then the bindings
can be used for switching. Finally, when a key different from the
keybindings withing this function is pressed, or optionally after
a certain timeout (by uncommenting the two commented lines),
centaur-tabs-mode gets deactivated (i.e. the tabs are 'hidden')."
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
                       (centaur-tabs-forward))
                      ((string= (single-key-description event) "<C-left>")
                       (centaur-tabs-backward))
                      ((string= (single-key-description event) "<C-right>")
                       (centaur-tabs-forward))
                      ((string= (single-key-description event) "<C-up>")
                       (centaur-tabs-backward-group))
                      ((string= (single-key-description event) "<C-down>")
                       (centaur-tabs-forward-group)))))))
    (centaur-tabs-mode 0)))

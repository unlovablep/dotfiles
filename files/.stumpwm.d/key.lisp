(defvar *top-map-keybinds*
  ;; these keybinds are directly called without any prefix
  (list
    ;; media keys
   '(:k "s-C-SPC" :c "exec playerctl play-pause")
   '(:k "XF86AudioRaiseVolume" :c "exec amixer sset Master 2%+,2%+")
   '(:k "XF86AudioLowerVolume" :c "exec amixer sset Master 2%-,2%-")
   '(:k "XF86AudioMute" :c "exec amixer sset Master toggle")
   '(:k "XF86AudioMicMute" :c "exec amixer sset Capture toggle")
   '(:k "XF86MonBrightnessUp" :c "exec xbacklight -inc 5")
   '(:k "XF86MonBrightnessDown" :c "exec xbacklight -dec 5")))

(defvar *root-map-keybinds*
  ;; these keybinds are available after pressing the prefix key (defined above)
  (list
    ;; wm functions
    '(:k "R" :c "restart-hard")
    '(:k "r" :c "iresize")
    '(:k "q" :c "delete")
    '(:k "Q" :c "quit-confirm")
    '(:k "f" :c "fullscreen")
    '(:k "ESC" :c "abort")
    ;; splits
    '(:k "s" :c "vsplit")
    '(:k "S" :c "hsplit")
    '(:k "x" :c "remove-split")
    ;; exec
    '(:k "d" :c "exec")
    '(:k ";" :c "colon")
    '(:k ":" :c "eval")
    ;; focus
    '(:k "Up" :c "move-focus up")
    '(:k "S-Up" :c "move-window up")
    '(:k "Left" :c "move-focus left")
    '(:k "S-Left" :c "move-window left")
    '(:k "Down" :c "move-focus down")
    '(:k "S-Down" :c "move-window down")
    '(:k "Right" :c "move-focus right")
    '(:k "S-Right" :c "move-window right")
    ;; other
    '(:k "=" :c "toggle-always-on-top")
    '(:k "S-SPC" :c "toggle-float") ; (toggle-float) command
    '(:k "t" :c "pull-hidden-next")
    '(:k "TAB" :c "windowlist")
    ;; launchers
    (list :k "RET" :c (format nil "exec ~a" *term*))
    '(:k "l" :c "exec firefox")
    '(:k "L" :c "exec librewolf")
    '(:k "b" :c "exec surf")
    (list :k "n" :c (format nil "exec ~a -e nvim" *term*))))

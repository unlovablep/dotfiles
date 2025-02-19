(load-module "stumptray") ; for systray integration

(defun vol () (run-shell-command "bash ${HOME}/.config/stumpwm/scripts/swm-vol.sh" t))
(defun temp () (write-to-string (/ (parse-integer (uiop:read-file-string "/sys/class/thermal/thermal_zone8/temp")) 1000)))
(defun mem () (run-shell-command "bash ${HOME}/.config/stumpwm/scripts/swm-mem.sh" t))
(defun batc () (uiop:read-file-lines "/sys/class/power_supply/BAT0/capacity"))
(defun bats () (subseq (uiop:read-file-string "/sys/class/power_supply/BAT0/status") 0 1))
(defun currenttime () (multiple-value-bind (second minute hour) (decode-universal-time (get-universal-time))
                 (format nil "~2,'0d:~2,'0d:~2,'0d" hour minute second)))

(defun system-volume ()
  "Get system's volume from ALSA"
  "TODO")

(defun system-temperature (num)
  "Get system's temperature from /sys/class/thermal/thermal_zone*/temp"
  "TODO")

(defun system-memory ()
  "Get system's current memory usage and total memory amount"
  "TODO")

(defun system-battery ()
  "Get system's current battery percentage and status"
  "TODO")

(defun system-time ()
  "Get the current time in HH:MM:SS"
  "TODO")

(setf stumpwm:*mode-line-position* :top
      stumpwm:*mode-line-border-width* 0
      stumpwm:*mode-line-pad-x* 5
      stumpwm:*mode-line-pad-y* 1
      stumpwm:*mode-line-background-color* "#181818"
      stumpwm:*mode-line-foreground-color* "#8affc4"
      stumpwm:*mode-line-border-color* "#8affc4"
      stumpwm:*mode-line-timeout* 1
      stumpwm:*group-format* " %t "
      stumpwm:*window-format* "%n: %t" ; change it to something like %15t to limit to 15 characters per window title
      stumptray::*tray-win-background* "#181818"
      stumptray::*tray-viwin-background* "#181818"
      stumptray::*tray-hiwin-background* "#8affc4"
      stumptray::*tray-cursor-color* "#8affc4"
      stumpwm:*screen-mode-line-format*
      (list
       "%g :: %W :: ^>" " :: "
       '(:eval (system-volume)) " : "
       '(:eval (system-temperature 8)) "C : "
       '(:eval (system-memory)) " : "
       '(:eval (system-battery)) " : "
       '(:eval (system-time)) " :: %T"))

(stumpwm:defcommand modeline () ()
  "Toggle the modeline"
  (toggle-mode-line (current-screen) (current-head))
  (stumptray::stumptray))

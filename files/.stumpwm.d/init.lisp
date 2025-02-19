(ql:quickload "xembed")
(ql:quickload "uiop")
(in-package :stumpwm)

(defun load-relative (fname)
  "Load a script file under the current directory"
  (load (format nil "~a" (merge-pathnames fname (make-pathname :directory (pathname-directory *load-truename*))))))

;;;; gaps
(stumpwm:load-module "swm-gaps") ; requires contrib libraries
(setf swm-gaps:*outer-gaps-size* 4
      swm-gaps:*inner-gaps-size* 2
      swm-gaps:*head-gaps-size* 0)
(swm-gaps:toggle-gaps)

;;;; workspaces
(defvar *workspaces*
  ;; name, select key, move-to key
  '((:n "1" :sk "s-1" :mk "s-!")
    (:n "2" :sk "s-2" :mk "s-@")
    (:n "3" :sk "s-3" :mk "s-#")
    (:n "4" :sk "s-4" :mk "s-$")
    (:n "5" :sk "s-5" :mk "s-%")
    (:n "6" :sk "s-6" :mk "s-^")
    (:n "7" :sk "s-7" :mk "s-&")
    (:n "8" :sk "s-8" :mk "s-*")
    (:n "9" :sk "s-9" :mk "s-(")
    (:n "V" :sk "s-0" :mk "s-)")))
(dolist (workspace (cdr *workspaces*)) ; create new workspaces
  (stumpwm:gnewbg (getf workspace :n)))
(stumpwm:grename (getf (nth 0 *workspaces*) :n)) ; rename first workspace

;;; workspace rules
(stumpwm:define-frame-preference "V"
  (0 t t :class "Virt-manager"))

;;;; autostart
(defvar *autostart-shell*
  '("xsetroot -solid '#101010'"
    "pkill picom"
    "picom --config ~/.stumpwm.d/picom.conf &"))
(dolist (cmd *autostart-shell*)
  (uiop:run-shell-command cmd))

;;;; general settings
(setf stumpwm:*message-window-gravity* :center
      stumpwm:*input-window-gravity* :center
      stumpwm:*window-border-style* :thin
      stumpwm:*message-window-padding* 10
      stumpwm:*maxsize-border-width* 4
      stumpwm:*normal-border-width* 4
      stumpwm:*transient-border-width* 4
      stumpwm:*float-window-border* 4
      stumpwm:*float-window-title-height* 4
      stumpwm:*mouse-focus-policy* :click)

;;;; theming
(stumpwm:set-float-focus-color "#8affc4")
(stumpwm:set-float-unfocus-color "#ffb3f3")
(stumpwm:set-focus-color "#8affc4")
(stumpwm:set-unfocus-color "#ffb3f3")
(stumpwm:set-win-bg-color "#181818")

;;;; floating
(stumpwm:defcommand toggle-float () ()
  "Toggle floating on the current window"
  (if (typep (current-window) 'STUMPWM::FLOAT-WINDOW)
      (progn ; if is floating already
        (unfloat-this)
        (toggle-always-on-top))
      (progn ; else is not floating yet
        (float-this)
        (toggle-always-on-top))))

;;;; keybinds
(defvar *term* "kitty")
(load-relative "key.lisp")
(stumpwm:set-prefix-key (kbd "s-T")) ; super-t is root-map

(dolist (keypair *top-map-keybinds*)
  (let ((keybind (getf keypair :k)) (command (getf keypair :c)))
    (stumpwm:define-key *top-map* (kbd keybind) command)))

(dolist (keypair *root-map-keybinds*)
  (let ((keybind (getf keypair :k)) (command (getf keypair :c)))
    (stumpwm:define-key *root-map* (kbd keybind) command)))

(dolist (workspace *workspaces*) ; set workspace keybinds
  (let ((name (getf workspace :n))
        (selkeybind (getf workspace :sk))
        (movekeybind (getf workspace :mk)))
    ;; switch to (should be something like "s-1" aka super-1)
    (stumpwm:define-key *top-map* (stumpwm:kbd (format nil "~a" selkeybind)) (format nil "gselect ~a" name))
    ;; move window to (should be something like "s-!" aka super-shift-1
    (stumpwm:define-key *top-map* (stumpwm:kbd (format nil "~a" movekeybind)) (format nil "gmove ~a" name))))

;;;; modeline
(load-relative "modeline.lisp")

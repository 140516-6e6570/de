(load-module "swm-gaps")
(run-shell-command "setxkbmap de")

(setf swm-gaps:*inner-gaps-size* 5)
(setf swm-gaps:*outer-gaps-size* 2)
(swm-gaps:toggle-gaps-on)

;; laptop functions

(define-key *top-map* (kbd "XF86AudioRaiseVolume") "exec mixer vol=+5%")
(define-key *top-map* (kbd "XF86AudioLowerVolume") "exec mixer vol=-5%")
(define-key *top-map* (kbd "XF86AudioMute") "exec mixer vol.mute=^")

(define-key *top-map* (kbd "XF86MonBrightnessUp") "exec backlight incr 10")
(define-key *top-map* (kbd "XF86MonBrightnessDown") "exec backlight decr 10")

(run-shell-command "feh --bg-scale ~/git/de/background/freebsd1.jpg")
(run-shell-command "Xorg :8 -config /usr/local/etc/X11/xorg-nvidia.conf &")
(run-shell-command "export VGL_DISPLAY=:8")

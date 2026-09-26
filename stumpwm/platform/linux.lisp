(load-module "swm-gaps")

(setf swm-gaps:*inner-gaps-size* 5)
(setf swm-gaps:*outer-gaps-size* 2)
(swm-gaps:toggle-gaps-on)

;; laptop functions

(define-key *top-map* (kbd "XF86AudioRaiseVolume") "exec wpctl set-volume @DEFAULT_SINK@ 5%+")
(define-key *top-map* (kbd "XF86AudioLowerVolume") "exec wpctl set-volume @DEFAULT_SINK@ 5%-")
(define-key *top-map* (kbd "XF86AudioMute")	   "exec wpctl set-mute   @DEFAULT_SINK@ toggle")

(define-key *top-map* (kbd "XF86MonBrightnessUp") "exec xbacklight -inc 10")
(define-key *top-map* (kbd "XF86MonBrightnessDown") "exec xbacklight -dec 10")

(run-shell-command "feh --bg-scale ~/git/de/background/freebsd1.jpg")

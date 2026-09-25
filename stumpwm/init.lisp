(defparameter *conf-dir* (directory-namestring "~/git/de/stumpwm/"))
(push *conf-dir* asdf:*central-registry*)
(redirect-all-output (merge-pathnames "log" *conf-dir*))

(set-module-dir "~/git/de/stumpwm/stumpwm-contrib/")

(load "~/git/de/stumpwm/modeline.lisp")

(run-shell-command "hsetroot -solid \"#000000\"")

(defparameter *os*
	(let ((s (software-type)))
		(if (or (search "linux"  s :test #'char-equal)
			(search "bsd"    s :test #'char-equal)
			(search "darwin" s :test #'char-equal))
			s
		(string-trim '(#\Space #\Newline)
			(run-shell-command "uname -s" t)))))

(defun os-p (name)
	"Case-insensitive substring match against the running OS."
	(search name *os* :test #'char-equal))
(let ((platform (cond ((os-p "FreeBSD") "platform/freebsd.lisp")
                      ((os-p "Linux")   "platform/linux.lisp"))))
	(when platform (load (merge-pathnames platform *conf-dir*))))

(run-shell-command "xmodmap -e 'clear mod4' -e 'keycode 133 = F20'" t)
(run-shell-command "xmodmap -e 'keycode 108 = ISO_Level3_Shift'" t)
(run-shell-command "xmodmap -e 'remove mod1 = ISO_Level3_Shift'" t)
(run-shell-command "xmodmap -e 'add mod5 = ISO_Level3_Shift'" t)

(load-module "desktop-entry")
(defvar *entry-paths*
	'(
	#P"/usr/share/applications/"
	#P"/var/lib/flatpak/exports/share/applications/"
	#P"~/.local/share/applications/"
	#P"~/.local/share/flatpak/exports/share/applications"
	))
(desktop-entry:init-entry-list *entry-paths*)

(set-prefix-key (kbd "F20"))
(define-key *root-map* (kbd "c") "exec kitty")
(define-key *root-map* (kbd "m") "mode-line")
(define-key *root-map* (kbd "M-1") "show-desktop-menu")

(gnewbg "2")
(gnewbg "3")
(gnewbg "4")
(refresh-heads)


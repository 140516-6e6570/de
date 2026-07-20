(let ((conf-dir (directory-namestring *load-truename*)))
	(push conf-dir asdf:*central-registry*)
	;; Log StumpWM messages.
	(redirect-all-output (merge-pathnames "log" conf-dir)))

(load-module "desktop-entry")
(load-module "screenshot")

(run-shell-command "xmodmap -e 'clear mod4' -e 'keycode 133 = F20'" t)
(run-shell-command "hsetroot -solid \"#000000\"")

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
(define-key *root-map* (kbd "@") "show-desktop-menu")

(gnew "2")
(gnew "3")
(gnew "4")
(gselect "Default")
(refresh-heads)

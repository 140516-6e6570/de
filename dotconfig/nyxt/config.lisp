(defvar *my-search-engines*
	(list
		'("python3" "https://docs.python.org/3/search.html?q=~a"
			"https://docs.python.org/3")
		'("doi" "https://dx.doi.org/~a" "https://dx.doi.org/")
		'("google" "https://google.com/search?q=~a" "https://google.com")
	)
	"List of search engines."
)

(define-configuration context-buffer
	"Go through the search engines above and make-search-engine out of them."
	((search-engines
		(append %slot-default%
			(mapcar
			(lambda (engine) (apply 'make-search-engine engine))
			*my-search-engines*)
		)
	))
)

(define-configuration context-buffer
	((history-file (make-instance 'history-file :base-path #p"/dev/null")))
)

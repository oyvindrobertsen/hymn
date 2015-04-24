# hymn

[![Build Status](http://ci.oyvindrobertsen.com/buildStatus/icon?job=hymn)](http://ci.oyvindrobertsen.com/job/hymn/)

Web framework for the [hy](http://hylang.org) language.
Conforms to WSGI standards.
Written as a learning exercise and probably shouldn't be used for anything at all.

# Installation

    $ pip install hymn

Depends on hy.

# Usage
```hy
; app.hy
(import
[hymn.app [App]])

(def app (App))

(.get app "/" (fn [request] "Hello, World!"))

(.run app)
```

    $ hy app.hy

# Development

## Todo

* Implement a proper router
* Templates? Jinja2?
* ORM?
* Pluggable middleware?

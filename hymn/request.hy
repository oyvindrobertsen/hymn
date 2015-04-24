(import [wsgiref.util])

(defclass Request
  ; Represents an HTTP request, encapsulates an WSGI environment.
  ; Provides convenience functions for access to request data.
  []
  [[--init-- (fn [self env]
                 (setv self.env env)
                 None)]
   [query-string (fn [self]
                     (try
                       (parse-query-string (get self.env "QUERY_STRING"))
                       (catch [e KeyError] {})))]
   (request-uri (fn [self &optional [include-query true]] (wsgiref.util.request-uri self.env include-query)))
   (path-info (fn [self]
                  (get self.env "PATH_INFO")))])

(defn parse-query-string
  [query-string]
  ; Returns a dictionary representing the query string passed.
  (dict-comp (get (.split pair "=") 0) (get (.split pair "=") 1) [pair (.split query-string "&")]))

(defn parse-request
  [env]
  ; Returns a Request instance, wrapping the env passed.
  (Request env))

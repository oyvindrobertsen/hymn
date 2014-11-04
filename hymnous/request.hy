(import [wsgiref.util])

(defclass Request
  []
  [[--init-- (fn [self env]
                 (setv self.env env)
                 None)]
   [query-string (fn [self]
                     (try
                       (parse-query-string (get self.env "QUERY_STRING"))
                       (catch [e KeyError] {})))]
   (request-uri (fn [self &optional [include-query true]] (wsgiref.util.request-uri self.env include-query)))])

(defn parse-query-string
  [query-string]
  (dict-comp (get (.split pair "=") 0) (get (.split pair "=") 1) [pair (.split query-string "&")]))

(defn parse-request
  [env]
  (Request env))

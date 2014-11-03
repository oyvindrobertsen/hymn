(defclass Request
  []
  [[__init__ (fn [self env]
                 (print env))]])

(defn parse-query-string
  [query-string]
  (dict-comp (get (.split pair "=") 0) (get (.split pair "=") 1) [pair (.split query-string "&")]))

(defn parse-request
  [env]
  (Request env))

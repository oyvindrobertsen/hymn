(defclass Request
  []
  [[__init__ (fn [self env]
                 (print env))]])

(defn parse-request
  [env]
  (Request env))

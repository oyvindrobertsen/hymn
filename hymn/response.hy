(defclass Response
  []
  [[status (fn [self] "200 OK")]
   [headers (fn [self] [])]
   [body ""]
   [set-body (fn [self body] (setv self.body body))]])

(defn get-response
  [request routes]
  ; Return a Response based on the HttpRequest request by matching the
  ; request path against routes added in the routes dict.
  (let [[res (Response)]]
   ((get routes (.path-info request)) request res)
   res))

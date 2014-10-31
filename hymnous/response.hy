(defclass Response
  []
  [[status (fn [self] "200 OK")]
   [headers (fn [self] [])]
   [body (fn [self] "Hello, World!")]])

(defn get-response
  [request routes]
  ; Return a Response based on the HttpRequest request by matching the
  ; request path against routes added in the routes dict.
  (Response))

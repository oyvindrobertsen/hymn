(import
  [wsgiref.simple-server [make-server]])

(import
  [hymnous.request [parse-request]]
  [hymnous.response [get-response]])


(defclass App
  []
  [[port 8080]
   [hostname "localhost"]
   [*debug* true]
   [routes {}]
   [wsgi-callback (fn [self environ start-response]
                      (let [[request (parse-request environ)]
                            [response (get-response request self.routes)]]
                        (print request.env)
                        (start-response (.encode (.status response) "utf-8") (.headers response))
                        [(.encode (.body response) "utf-8")]))]
   [run (fn [self]
            (let [[httpd (make-server self.hostname self.port self.wsgi-callback)]]
              (apply print ["Serving on http://" self.hostname ":" self.port] {"sep" ""})
              (.serve-forever httpd)))]])

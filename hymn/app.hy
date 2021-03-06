(import
  [wsgiref.simple-server [make-server]])

(import
  [hymn.request [parse-request]]
  [hymn.response [get-response]])


(defclass App
  []
  [[port 8080]
   [hostname "localhost"]
   [*debug* true]
   [get-callbacks {}]
   [add-get (fn [self path callback] (assoc self.get-callbacks path callback))]
   [wsgi-callback (fn [self environ start-response]
                      (let [[request (parse-request environ)]
                            [response (get-response request self.get-callbacks)]]
                        (start-response (.encode (.status response) "utf-8") (.headers response))
                        [(.encode (. response body) "utf-8")]))]
   [run (fn [self]
            (let [[httpd (make-server self.hostname self.port self.wsgi-callback)]]
              (apply print ["Serving on http://" self.hostname ":" self.port] {"sep" ""})
              (.serve-forever httpd)))]])

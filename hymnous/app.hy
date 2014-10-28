(import
  [wsgiref.simple_server [make_server]]
  [types [StringType]])

(defclass App
  []
  [[port 8080]
   [hostname "localhost"]
   [*debug* true]
   [route {}]
   [wsgi-callback (fn [self environ start-response]
                      (start-response (.encode "200 OK" "utf-8") [])
                      [(.encode "Wee" "utf-8")])]
   [run (fn [self]
            (let [[httpd (make_server "localhost" self.port self.wsgi-callback)]]
              (apply print ["Serving on http://" self.hostname ":" self.port] {"sep" ""})
              (.serve_forever httpd)))]])

(require hytest)

(import 
  [hymnous.request [parse-query-string]]
  [hymnous.request [parse-request]]
  [wsgiref.util [setup-testing-defaults]])

(test-set parse-query-string-tests
          (test == {"q" "123" "name" "test"} (parse-query-string "q=123&name=test")))

(test-set parse-request-tests
          (test-setup
            (def env {})
            (setup-testing-defaults env)
            (def req (parse-request env))
            (assoc (. req env) "QUERY_STRING" "q=123&name=test"))
          (test == {"q" "123" "name" "test"} (.query-string req))
          (test == "http://127.0.0.1/" (.request-uri req false)))

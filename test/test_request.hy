(require hytest)

(import 
  [hymn.request [parse-query-string]]
  [hymn.request [parse-request]]
  [wsgiref.util [setup-testing-defaults]])

(test-set parse-query-string-tests
          (test == {"q" "123" "name" "test"} (parse-query-string "q=123&name=test")))

(test-set parse-request-tests
          (test-setup
            (def env {})
            (setup-testing-defaults env)
            (def req (parse-request env))
            (assoc (. req env) "QUERY_STRING" "q=123&name=test")
            (assoc (. req env) "PATH_INFO" "/test/path"))
          (test == {"q" "123" "name" "test"} (.query-string req))
          (test == "http://127.0.0.1/test/path" (.request-uri req false))
          (test == "http://127.0.0.1/test/path?q=123&name=test" (.request-uri req true))
          (test == "/test/path" (.path-info req)))

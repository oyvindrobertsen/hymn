(require hytest)

(import [hymnous.request [parse-query-string]])

(test-set parse-query-string-tests
          (test == {"q" "123" "name" "test"} (parse-query-string "q=123&name=test")))

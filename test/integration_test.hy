(import
  [hymnous.app [App]])

(def app (App))

(.add-get app "/" (fn [req res] (.set-body res "routing works!")))

(.run app)

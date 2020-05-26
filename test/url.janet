(import ../url)

(def result-full
  (url/format
    :scheme "https"
    :auth "a:b"
    :host "www.example.com"
    :port 8080
    :path "/v1/my-path"
    :query {:a 1 :b 2}
    :hash "my-hash"))
(assert
  (= result-full
     "https://a:b@www.example.com:8080/v1/my-path?a=1&b=2#my-hash"))

(def result-empty (url/format))
(assert (= result-empty ""))

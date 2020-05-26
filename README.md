# Janet URL

`jpm install https://github.com/brandonchartier/janet-url`

---

```
(import url)

(url/format
  :scheme "https"
  :auth "user:pass"
  :host "www.example.com"
  :port 8080
  :path "/v1/my-path"
  :query {:a 1 :b 2}
  :hash "my-hash")
  # "https://user:pass@www.example.com:8080/v1/my-path?a=1&b=2#my-hash"
```

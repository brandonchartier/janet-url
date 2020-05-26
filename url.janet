(import uri)

(defn- format-scheme [scheme]
  (if (nil? scheme) "" (string scheme "://")))

(defn- format-auth [auth]
  (if (nil? auth) "" (string auth "@")))

(defn- format-host [host]
  (if (nil? host) "" host))

(defn- format-port [port]
  (if (nil? port) "" (string ":" port)))

(defn- format-path [path]
  (if (nil? path) "" path))

(defn- query-reducer [acc [k v]]
  (array/push acc (string k "=" (uri/escape (string v)))))

(defn- format-query [dict]
  (if (nil? dict)
    ""
    (let [strings (reduce query-reducer @[] (pairs dict))]
      (string "?" (string/join strings "&")))))

(defn- format-hash [hash]
  (if (nil? hash) "" (string "#" hash)))

(defn format
  "Creates a URL from keyword arguments."
  [&keys {:scheme scheme
          :auth auth
          :host host
          :port port
          :path path
          :query query
          :hash hash}]
  (string (format-scheme scheme)
          (format-auth auth)
          (format-host host)
          (format-port port)
          (format-path path)
          (format-query query)
          (format-hash hash)))

(ns user
  (:require [mount.core :as mount]
            vocab.core))

(defn start []
  (mount/start-without #'vocab.core/repl-server))

(defn stop []
  (mount/stop-except #'vocab.core/repl-server))

(defn restart []
  (stop)
  (start))



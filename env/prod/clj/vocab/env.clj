(ns vocab.env
  (:require [clojure.tools.logging :as log]))

(def defaults
  {:init
   (fn []
     (log/info "\n-=[vocab started successfully]=-"))
   :stop
   (fn []
     (log/info "\n-=[vocab has shut down successfully]=-"))
   :middleware identity})

(ns vocab.handler
  (:require [compojure.core :refer [routes wrap-routes]]
            [vocab.routes.services :refer [service-routes]]
            [compojure.route :as route]
            [vocab.env :refer [defaults]]
            [mount.core :as mount]
            [vocab.middleware :as middleware]))

(mount/defstate init-app
                :start ((or (:init defaults) identity))
                :stop  ((or (:stop defaults) identity)))

(def app-routes
  (routes
    #'service-routes
    (route/not-found
      "page not found")))


(defn app [] (middleware/wrap-base #'app-routes))

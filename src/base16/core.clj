(ns base16.core
  (:require [babashka.cli :as cli]
            [pogonos.core :as pg]
            [clojure.java.io :as io]
            [clojure.string :as str]
            [clojure.set :as set]
            [clj-yaml.core :as yaml])
  (:gen-class))

(defn render [template scheme]
  (let [scheme (yaml/parse-string scheme)]
    ;; why vars in templates are different than in schemes??!!
    (println (pg/render-string
     (slurp template)
     (set/rename-keys
      scheme
      (zipmap
       (keys scheme)
       (map (fn [key] (str/join "" (list (name key) "-hex"))) (keys scheme))))))))

(defn -main [& args]
  (let [{:keys [template scheme]} (cli/parse-opts args)]
    (if scheme
      (println (render template scheme))
      (with-open [r (io/reader *in*)]
        (render template (str/join "\n" (line-seq r)))
        ))))

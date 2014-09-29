#!/usr/bin/env java -cp /Users/jani/.m2/repository/org/clojure/clojure/1.5.1/clojure-1.5.1.jar clojure.main

(ns euler-clojure.core
  (:gen-class))

(require '[clojure.set])

(defn divs_sum [n]
   (list n (reduce + (filter #(== (rem n %) 0) (range 1,n)))))

(defn run [x]
  (let [col (apply hash-map (flatten (for [x (range 1,x)] (divs_sum x))))]
   (println (reduce + (set ( flatten(for [k (keys col)
                       v (vals col)
        ; :let [k v]
        :when (and (not= k v) (contains? col k) (contains? col v) (== k (get col v)) (== v (get col k)))
                       ]
        (list k v))))))
))

(defn -main []
  (run 10000))

(defn fact [n]
  (if (== n 1) n (* n (fact (dec n)))))

(defn split [n]
  (if (>= n 9)
   (conj (split (quot n 10)) (rem n 10))
   [n]))

(defn -main []
  (println (reduce + (flatten(split (fact 100N))))))

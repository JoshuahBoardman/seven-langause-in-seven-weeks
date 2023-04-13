;; first assignment
(defn big [st n]
  (> (count st) n))

;; second assignment
(defn collection-type [col]
  (let [col-type (type col)
        collections {clojure.lang.PersistentVector :vec
                     clojure.lang.PersistentList :list
                     clojure.lang.PersistentArrayMap :map
                     clojure.lang.PersistentHashSet :set}]
    (collections col-type)))


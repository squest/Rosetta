(ns rosetta.sorting)

(defn quick-sort
  "Functional implementation of quick-sort"
  [col]
  (if (empty? col)
    []
    (let [x (first col)
          smaller (filter #(<= % x) (rest col))
          larger (filter #(> % x) (rest col))]
      (concat (quick-sort smaller)
              [x]
              (quick-sort larger)))))

(declare merge')

(defn merge-sort
  "Functional implementation of merge-sort"
  [col]
  (if (<= (count col) 1)
    col
    (let [ctr (count col)
          [first-half second-half]
          (split-at (quot ctr 2) col)]
      (merge' (merge-sort first-half)
              (merge-sort second-half)))))

(defn merge'
  "Helper function for merging two sorted coll"
  [col1 col2]
  (cond
    (empty? col1) col2
    (empty? col2) col1
    :else (loop [[c1 & cl1 :as rc1] col1 [c2 & cl2 :as rc2] col2 res []]
            (cond
              (nil? c1) (apply conj res c2 cl2)
              (nil? c2) (apply conj res c1 cl1)
              :else (if (<= c1 c2)
                      (recur cl1 rc2 (conj res c1))
                      (recur rc1 cl2 (conj res c2)))))))

(defn time-it
  [f lst]
  (time (reduce + (f lst))))

(ns rosetta.sorting-test
  (:require [clojure.test :refer :all]
            [rosetta.sorting :refer :all]))

(deftest sorting-test
  (testing "quicksort"
    (let [lst (range 30)
          slst (shuffle lst)]
      (is (= lst (quick-sort lst)))
      (is (= [] (quick-sort [])))
      (is (= [\a \b \c] (quick-sort "abc")))
      (is (= (map str "abcdefghij")
             (quick-sort (map str (shuffle (apply list "abcdefghij"))))))
      (println "Make sure it doesnt stack overflow")
      (is (= (range 5000)
             (quick-sort (shuffle (range 5000)))))))
  (testing "mergesort"
    (let [lst (range 30)
          slst (shuffle lst)]
      (is (= lst (merge-sort lst)))
      (is (= [] (merge-sort [])))
      (is (= [\a \b \c] (merge-sort "abc")))
      (is (= (map str "abcdefghij")
             (merge-sort (map str (shuffle (apply list "abcdefghij"))))))
      (println "Make sure it doesnt cause stack overflow for large sequence")
      (is (= (range 5000)
             (quick-sort (shuffle (range 5000))))))))



(ns rosetta.sorting-test
  (:require
    [clojure.test :refer :all]
    [rosetta.sorting :refer :all]))

(deftest sorting-test
  (testing "quicksort for numbers, chars, and string"
    (let [lst (range 30)
          slst (shuffle lst)]
      (is (= lst (quick-sort slst)))
      (is (= [] (quick-sort [])))
      (is (= [\a \b \c] (quick-sort "abc")))
      (is (= (map str "abcdefghij")
             (quick-sort (map str (shuffle (apply list "abcdefghij"))))))
      (println "Make sure it doesnt cause stack overflow for large sequence")
      (let [lst (range 5000)
            slst (shuffle lst)]
        (println "Time taken for quick-sort 5000 elements")
        (is (= lst (time (quick-sort slst)))))))
  (testing "mergesort for numbers, chars, and string"
    (let [lst (range 30)
          slst (shuffle lst)]
      (is (= lst (merge-sort slst)))
      (is (= [] (merge-sort [])))
      (is (= [\a \b \c] (merge-sort "abc")))
      (is (= (map str "abcdefghij")
             (merge-sort (map str (shuffle (apply list "abcdefghij"))))))
      (println "Make sure it doesnt cause stack overflow for large sequence")
      (let [lst (range 5000)
            slst (shuffle lst)]
        (println "Time taken for merge-sort 5000 elements")
        (is (= lst (time (merge-sort slst)))))))
  (testing "insertion sort for numbers, chars, and string"
    (let [lst (range 30)
          slst (shuffle lst)]
      (is (= lst (isort slst)))
      (is (= [] (isort [])))
      (is (= [\a \b \c] (isort "abc")))
      (is (= (map str "abcdefghij")
             (isort (map str (shuffle (apply list "abcdefghij"))))))
      (println "Make sure it doesnt cause stack overflow for large sequence")
      (let [lst (range 5000)
            slst (shuffle lst)]
        (println "Time taken for insertion sort 5000 elements")
        (is (= lst (time (isort slst))))))))



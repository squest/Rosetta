(ns rosetta.number-test
  (:require
    [clojure.test :refer :all]
    [rosetta.number :refer :all]))

(defn fibo?
  "Checking whether a list is a fibonacci list"
  [lst]
  (loop [[a b c :as col] lst]
    (if c
      (if (== (+' a b) c)
        (recur (rest col))
        false)
      true)))

(deftest fibonacci-test
  (time
    (testing "Fibonacci sequence"
      (let [n (rand-int 10000)
            multiplier 1000]
        (println "Testing whether it generates the same number of fibo numbers")
        (is (= (take n fibo-list) (fibo n)))
        (println "Testing whether it takes the numbers according to pred")
        (is (= (take-while #(< % (* multiplier n)) fibo-list)
               (fibo #(< % (* multiplier n)))))
        (println "Testing whether the list is actually a fibo-list")
        (is (= true (fibo? (fibo n)))))
      (let [n (rand-int 10000)
            multiplier 1000]
        (println "Testing whether it generates the same number of fibo numbers")
        (is (= (take n fibo-list) (fibo n)))
        (println "Testing whether it takes the numbers according to pred")
        (is (= (take-while #(< % (* multiplier n)) fibo-list)
               (fibo #(< % (* multiplier n)))))
        (println "Testing whether the list is actually a fibo-list")
        (is (= true (fibo? (fibo n)))))
      (let [n (rand-int 10000)
            multiplier 1000]
        (println "Testing whether it generates the same number of fibo numbers")
        (is (= (take n fibo-list) (fibo n)))
        (println "Testing whether it takes the numbers according to pred")
        (is (= (take-while #(< % (* multiplier n)) fibo-list)
               (fibo #(< % (* multiplier n)))))
        (println "Testing whether the list is actually a fibo-list")
        (is (= true (fibo? (fibo n))))))))

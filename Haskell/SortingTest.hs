module Main where

import Test.QuickCheck
import Sorting
import Data.List

qsortTest xs = (quickSort xs) == (sort xs)
msortTest xs = (mergeSort xs) == (sort xs)
isortTest xs = (iSort xs) == (sort xs)

main = do
  quickCheck (qsortTest :: [Int] -> Bool)
  quickCheck (qsortTest :: [Integer] -> Bool)
  quickCheck (qsortTest :: [Char] -> Bool)
  quickCheck (qsortTest :: [String] -> Bool)
  quickCheck (qsortTest :: [Float] -> Bool)
  quickCheck (msortTest :: [Int] -> Bool)
  quickCheck (msortTest :: [Integer] -> Bool)
  quickCheck (msortTest :: [Char] -> Bool)
  quickCheck (msortTest :: [String] -> Bool)
  quickCheck (msortTest :: [Float] -> Bool)
  quickCheck (isortTest :: [Int] -> Bool)
  quickCheck (isortTest :: [Integer] -> Bool)
  quickCheck (isortTest :: [Char] -> Bool)
  quickCheck (isortTest :: [String] -> Bool)
  quickCheck (isortTest :: [Float] -> Bool)

    
  

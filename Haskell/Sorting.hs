module Sorting where

import Data.List 

quickSort [] = []
quickSort (x:[]) = [x]
quickSort (x:xs) = (quickSort smaller) ++ [x] ++ (quickSort larger)
  where smaller = filter (<= x) xs
        larger = filter (> x) xs

mergeSort [] = []
mergeSort (x:[]) = [x]
mergeSort xs = merge (mergeSort half1) (mergeSort half2)
  where ctr = length xs
        half1 = take (div ctr 2) xs
        half2 = drop (div ctr 2) xs

merge [] xs = xs
merge xs [] = xs
merge xxs@(x:xs) yys@(y:ys)
  | (x <= y) = x : (merge xs yys)
  | otherwise = y : (merge xxs ys)

iSort [] = []
iSort (x:[]) = [x]
iSort (x:xs) = iter xs [x]
  where iter [] res = res
        iter (l:ls) res = iter ls (smaller ++ [l] ++ larger)
          where smaller = takeWhile (<= l) res
                larger = dropWhile (<= l) res

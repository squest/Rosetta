module Number where

import Data.List

sieve = 2 : filter prime [3,5..]

prime p = all (\x -> 0 /= (rem p x)) $ takeWhile (\x -> x^2 <= p) sieve

isPrime p = all (\x -> 0 /= rem p x) $ takeWhile (\x -> x^2 <= p) sieve


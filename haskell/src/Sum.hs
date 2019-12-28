
module Sum (recSum) where

recSum :: Int -> Int
recSum 0 = 0
recSum n = n + recSum (n-1)


module FastSum where

fastSum :: Int -> Int
fastSum 1 = 1
fastSum n 
  | n `mod` 2 == 1 = n + fastSum (n-1) 
  | otherwise      = (n `div` 2)*(n `div` 2) + 2 * fastSum (n `div` 2)


module SimpleMul where

import Data.List

chunks :: Int -> [Int] -> [[Int]]
chunks _ [] = []
chunks n xs = (take n xs) : (chunks n (drop n xs))


padZeros :: Int -> [[Int]] -> [[Int]]
padZeros _ [[]] = [[]]
padZeros n xs = flip map enumed $ \(i, x) -> 
    zeros i ++ x ++ zeros (n-i-1) 

    where enumed = zip [0..] xs
          zeros  = flip take $ repeat 0


digitSum :: [[Int]] -> [Int]
digitSum xs = map sum $ transpose xs

digitSum' :: Int -> [Int] -> [Int]
digitSum' _ [] = []
digitSum' over (x:xs) = one : digitSum' dec xs
    where dec = (x+over) `div` 10
          one = (x+over) `mod` 10


simpleMul :: [Int] -> [Int] -> [Int]
simpleMul a b = reverse 
               . digitSum' 0
               . reverse 
               . digitSum 
               . padZeros n 
               . chunks n $ muls
    where muls = (*) <$> a <*> b
          n    = length a



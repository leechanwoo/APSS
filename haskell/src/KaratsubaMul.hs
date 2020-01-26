
module KaratsubaMul where

import Debug.Trace
import SimpleMul (simpleMul, digitSum')


simpleAdd :: [Int] -> [Int] -> [Int]
simpleAdd a b 
  | la > lb = simpleAdd a ((take (la - lb) $ repeat 0) ++ b) 
  | la < lb = simpleAdd ((take (lb - la) $ repeat 0) ++ a) b
  | otherwise = reverse . digitSum' 0 $ reverse . map (\(x,y) -> x + y) $ zip a b
    where la = length a
          lb = length b


simpleSub :: [Int] -> [Int] -> [Int]
simpleSub a b 
  | la > lb   = simpleSub a ((take (la - lb) $ repeat 0) ++ b)
  | la < lb   = simpleSub ((take (lb - la) $ repeat 0) ++ a) b
  | otherwise = map (\(x,y) -> x - y ) $ zip a b
  where la = length a
        lb = length b


subDown' :: [Int] -> [Int]
subDown' [] = []
subDown' (x:[]) = [x]
subDown' ls@(x1:x2:xs) 
  | x2 < 0 = (x1-1):subDown' (10+x2:xs)
  | otherwise = x1:subDown' (x2:xs)


subDown :: [Int] -> [Int]
subDown xs 
  | any (<0) xs = subDown $ subDown' xs
  | otherwise = xs



karatsubaMul :: [Int] -> [Int] -> [Int]
karatsubaMul a b = foldl1 simpleAdd [z0++e0, z1++e1, z2]
    where hdigits = (length a) `div` 2
          digits = length a
          a0 = take hdigits a
          a1 = drop hdigits a
          b0 = take hdigits b
          b1 = drop hdigits b
          z2 = simpleMul a1 b1
          z0 = simpleMul a0 b0
          a0a1 = simpleAdd a0 a1 
          b0b1 = simpleAdd b0 b1
          z0z2 = simpleAdd z0 z2
          z1 = subDown $ simpleSub (simpleMul a0a1 b0b1) z0z2
          e0 = take digits $ repeat 0
          e1 = take hdigits $ repeat 0


        



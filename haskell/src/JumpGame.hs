
module JumpGame (jump, jMemo) where

import Debug.Trace


jump :: [[Int]] -> Bool
jump [] = False
jump ((0:xs):ys) = True
jump ([]:ys) = jump ys
jump jss = jump (map (drop j) jss) || jump (drop j jss)
    where j = jss!!0!!0


jMemo :: [[Int]] -> [Bool]
jMemo jss = map (\(y, x) -> jump $ map (drop x) (drop y jss)) pos
    where pos = (,) <$> [0..] <*> [0..]


module JumpGame (jump, jumpMemo) where

import Debug.Trace

jump :: [[Int]] -> Bool
jump [] = False
jump ((0:xs):ys) = True
jump ([]:ys) = jump ys
jump jss = jump (map (drop j) jss) || jump (drop j jss)
    where j = jss!!0!!0


jMemo :: [[Int]] -> Int -> Bool
jMemo jss = ((map (\(y, x) -> jump $ map (drop x) (drop y jss)) pos) !!)
    where pos = (,) <$> [0..] <*> [0..]


jumpMemo :: Int -> Int -> [[Int]] -> Bool 
jumpMemo x y jss 
  | x >= szjss || y >= szjss = False
  | jMemo jss (y * szjss + x) = True
  | otherwise = jumpMemo mr y jss || jumpMemo x md jss
    where szjss = length jss
          mr = x + jss!!y!!x 
          md = y + jss!!y!!x


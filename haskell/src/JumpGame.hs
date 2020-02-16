
module JumpGame (jump) where

import Debug.Trace

jump :: [[Int]] -> Bool
jump [] = False
jump ((0:xs):ys) = True
jump ([]:ys) = jump ys
jump org@((j:xs):ys) = jump (map (drop j) org) || jump (drop (j-1) ys)

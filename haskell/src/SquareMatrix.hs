
module SquareMatrix where

import Data.Matrix

pow :: Num a => Int -> Int -> Matrix a -> Matrix a
pow size 0 mat = identity size
pow size m mat 
  | odd m = (pow size (m-1) mat) * mat
  | otherwise = (pow size hm mat) * (pow size hm mat)
    where
        hm = m `div` 2


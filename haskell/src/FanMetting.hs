
module FanMetting (hugs) where

import SimpleMul (chunks, padZeros, digitSum)
import Debug.Trace

hugs :: [Int] -> [Int] -> Int
hugs xs ys = length $ filter (==0) $ drop (members-1) . take fans $ allHug
    where members = length xs
          fans = length ys
          mul = (*) <$> reverse xs <*> ys
          allHug = digitSum . padZeros members . chunks fans $ mul



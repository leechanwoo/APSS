
module CuttingFence (solveMax) where

import Debug.Trace
import Data.List

type Fences  = [Int]
type Areas = [Area]
type Area = Int


solveMax :: Fences -> Area
solveMax [x] = x
solveMax fs = maximum [solveMax hfs, maxCut fs, solveMax tfs]
    where (hfs, tfs) = splitAt (length fs `div` 2) fs


maxCut :: Fences -> Area
maxCut xs = maximum $ cut 2 rhxs ttxs [hrhx, htx]
    where hsize = length xs `div` 2
          (hxs, txs) = splitAt hsize xs
          (hrhx:rhxs) = reverse $ hxs
          (htx:ttxs) = txs
        

cut :: Int -> Fences -> Fences -> Fences -> Areas
cut n [] [] cs = [n*minimum cs]
cut n [] (b:bs) cs = (n*minimum cs):(cut (n+1) [] bs (b:cs))
cut n (a:as) [] cs = (n*minimum cs):(cut (n+1) as [] (a:cs))
cut n oas@(a:as) obs@(b:bs) cs 
  | a > b = area:(cut (n+1) as obs (a:cs))
  | a < b = area:(cut (n+1) oas bs (b:cs))
  | otherwise = area : (cut (n+2) as bs (a:b:cs))  

    where area = n * minimum cs



module Main where
    
import Control.Monad.Trans.State

import Sum (recSum)
import Combination (pick)
import BoggleGame (hasWord)
import Picnic (countPairings)
import BoardCover (cover)
import TravelingSales (shortestPath)
import ClockAlign (solve)
import FastSum (fastSum)
import SquareMatrix (pow)
import Data.Matrix
import SimpleMul (simpleMul)
import KaratsubaMul (karatsubaMul)
import QuadTreeFlip (decompress, flipCode)
import CuttingFence 
import FanMetting
import FibonacciMemo 
import JumpGame 

import Data.Time (getCurrentTime, diffUTCTime)
import System.Environment


main :: IO ()
main = do
    args <- getArgs
    print $ "Selected Problem: " ++ (head args)

    start <- getCurrentTime 
    case args of 
      []                   -> print $ "Nothing run"

      ("Sum":_)            -> print $ 
          recSum 9999999

      ("Combine":_)        -> pick 10 [] 3 

      ("BoggleGame":_)     -> print $ 
          hasWord 1 1 "PRETTY"

      ("Picnic":_)         -> print $ 
          countPairings (take 10 $ repeat False) 

      ("BoardCover":_)     -> print $ 
          cover [[1,1,1,1,1,1,1,1,1,1] 
                ,[1,0,0,0,0,0,0,0,0,1] 
                ,[1,0,0,0,0,0,0,0,0,1] 
                ,[1,0,0,0,0,0,0,0,0,1] 
                ,[1,0,0,0,0,0,0,0,0,1] 
                ,[1,0,0,0,0,0,0,0,0,1] 
                ,[1,0,0,0,0,0,0,0,0,1] 
                ,[1,1,1,1,1,1,1,1,1,1]]

      ("TravelingSales":_) -> print $ 
          shortestPath [0] [True, False, False, False, False] 0

      ("ClockAlign":_)     -> print $ 
          solve [12,9,3,12,6,6,9,3,12,9,12,9,12,12,6,6]

      ("FastSum":_)        -> print $ 
          fastSum 9999999

      ("SquareMatrix":_)   -> print $ 
          pow 3 100 $ fromLists [[1, 0, 0] 
                                ,[0, 1, 0] 
                                ,[0, 0, 1]]

      ("SimpleMul":_)      -> print $ 
          simpleMul [1,2,3,4,5,6,7,8,9,0] [1,2,3,4,5,6,7,8,9,0]

      ("KaratsubaMul":_)   -> print $ 
          karatsubaMul [1,2,3,4,5,6,7,8,9,0] [1,2,3,4,5,6,7,8,9,0]
      
      ("QuadTreeFlip":_)   -> do
          let code = "xxwwwbxwxwbbbwwxxxwwbbbwwwwbb"
          print code
          mapM_ print $ evalState (decompress 16) code
          let code' = evalState flipCode code
          print $ code'
          mapM_ print $ evalState (decompress 16) code'

      ("CuttingFence":_)   -> do 
          let case1 = [7, 1, 5, 9, 6, 7, 3]
          let case2 = [1, 4, 4, 4, 4, 1, 1]
          let case3 = [1, 8, 2, 2]
          print $ case1
          print $ solveMax case1

          print $ case2
          print $ solveMax case2 

          print $ case3
          print $ solveMax case3 

      ("FanMeeting":_)     -> do
          print $ hugs [0,0,0,1,1,1] [1,1,1,0,0,0]
          print $ hugs [0, 0, 0, 0, 0] [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
          print $ hugs [0, 0, 0, 0, 1] [0, 0, 0, 0, 0, 1, 1, 1, 1, 0]
          print $ hugs [1,0,1,0,1,0,0,0,1,1,1,0,1,0] 
                       [1,1,0,0,0,0,0,1,0,0,0,1,0
                       ,0,0,0,0,0,1,0,0,0,1,0,0,0
                       ,0,1,0,1,1,0,0,0,0,0,0,0]


      ("NaiveFibonacci":_) -> print $ naiveFib 50

      ("MemoizationFibonacci":_) -> print $ fibMemo 50

      ("JumpGame":_) -> do
          let trueCase = [[2, 5, 1, 6, 1, 4, 1]
                         ,[6, 1, 1, 2, 2, 9, 3]
                         ,[7, 2, 3, 2, 1, 3, 1]
                         ,[1, 1, 3, 1, 7, 1, 2]
                         ,[4, 1, 2, 3, 4, 1, 2]
                         ,[3, 3, 1, 2, 3, 4, 1]
                         ,[1, 5, 2, 9, 4, 7, 0]]

          let falseCase = [[2, 5, 1, 6, 1, 4, 1]
                          ,[6, 1, 1, 2, 2, 9, 3]
                          ,[7, 2, 3, 2, 1, 3, 1]
                          ,[1, 1, 3, 1, 7, 1, 2]
                          ,[4, 1, 2, 3, 4, 1, 3]
                          ,[3, 3, 1, 2, 3, 4, 1]
                          ,[1, 5, 2, 9, 4, 7, 0]]

          let falseCase2 = [[1, 1, 1, 1, 1, 1, 1]
                           ,[1, 1, 1, 1, 1, 1, 1]
                           ,[1, 1, 1, 1, 1, 1, 1]
                           ,[1, 1, 1, 1, 1, 1, 1]
                           ,[1, 1, 1, 1, 1, 1, 1]
                           ,[1, 1, 1, 1, 1, 1, 2]
                           ,[1, 1, 1, 1, 1, 2, 0]]

          print $ "Naive Jump"
          print $ "True case:"
          print $ jump trueCase
          print $ "False case:"
          print $ jump falseCase
          print $ "Fasle case2:"
          print $ jump falseCase2
          print $ "Memo Jump"
          print $ "True case:"
          print $ jumpMemo 0 0 trueCase 
          print $ "False case:"
          print $ jumpMemo 0 0 falseCase
          print $ "Fasle case2:"
          print $ jumpMemo 0 0 falseCase2


      (_:_)                -> print $ "Invalid Input"
    
    end <- getCurrentTime 
    print $ "Process time: " ++ (show $ diffUTCTime end start)



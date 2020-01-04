module Main where

import Sum (recSum)
import Combination (pick)
import BoggleGame (hasWord)
import Picnic (countPairings)
import BoardCover (cover)
import TravelingSales (shortestPath)

import Data.Time (getCurrentTime, diffUTCTime)
import System.Environment

main :: IO ()
main = do
    args <- getArgs
    print $ "Selected Problem: " ++ (head args)

    start <- getCurrentTime 
    case args of 
      []                   -> print $ "Nothing run"
      ("Sum":_)            -> print $ recSum 100
      ("Combine":_)        -> pick 10 [] 3 
      ("BoggleGame":_)     -> print $ hasWord 1 1 "PRETTY"
      ("Picnic":_)         -> print $ countPairings (take 10 $ repeat False) 
      ("BoardCover":_)     -> print $ cover [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
                                            ,[1, 0, 0, 0, 0, 0, 0, 0, 0, 1]
                                            ,[1, 0, 0, 0, 0, 0, 0, 0, 0, 1]
                                            ,[1, 0, 0, 0, 0, 0, 0, 0, 0, 1]
                                            ,[1, 0, 0, 0, 0, 0, 0, 0, 0, 1]
                                            ,[1, 0, 0, 0, 0, 0, 0, 0, 0, 1]
                                            ,[1, 0, 0, 0, 0, 0, 0, 0, 0, 1]
                                            ,[1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]

      ("TravelingSales":_) -> print $ 
          shortestPath [0] [True, False, False, False, False] 0

      (_:_)                -> print $ "Invalid Input"
    
    end <- getCurrentTime
    print $ "Process time: " ++ (show $ diffUTCTime end start)



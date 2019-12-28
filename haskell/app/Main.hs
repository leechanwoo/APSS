module Main where

--import Sum (recSum)
--import Combination (pick)
--import BoggleGame (hasWord)
--import Picnic (countPairings)
import BoardCover (cover)

import Data.Time (getCurrentTime, diffUTCTime)

main :: IO ()
main = do
    start <- getCurrentTime 
    --print $ recSum 100
    --pick 10 [] 3 
    --print $ hasWord 1 1 "PRETTY"
    --print $ countPairings [False | x <- [0..9]]

    print $ cover [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
                  ,[1, 0, 0, 0, 0, 0, 0, 0, 0, 1]
                  ,[1, 0, 0, 0, 0, 0, 0, 0, 0, 1]
                  ,[1, 0, 0, 0, 0, 0, 0, 0, 0, 1]
                  ,[1, 0, 0, 0, 0, 0, 0, 0, 0, 1]
                  ,[1, 0, 0, 0, 0, 0, 0, 0, 0, 1]
                  ,[1, 0, 0, 0, 0, 0, 0, 0, 0, 1]
                  ,[1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]
    
    end <- getCurrentTime
    print $ diffUTCTime end start


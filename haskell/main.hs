
import Sum 
import Combination
import BoggleGame
import Picnic


import Data.Time


main = do
    start <- getCurrentTime 
    print $ recSum 100
    --pick 99 [] 3 
    --print $ hasWord 1 1 "PRETTY"
    --print $ countPairings [False | x <- [0..9]]

    end <- getCurrentTime
    print $ diffUTCTime end start




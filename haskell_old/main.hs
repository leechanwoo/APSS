
import Sum 
import Combination
import BoggleGame
import Picnic
import CoveringGamePannel


import Data.Time


main = do
    start <- getCurrentTime 
    --print $ recSum 100
    --pick 10 [] 3 
    --print $ hasWord 1 1 "PRETTY"
    --print $ countPairings [False | x <- [0..9]]

    let board = [[1, 0, 0, 0, 0, 0, 1]
                ,[1, 0, 0, 0, 0, 0, 1]
                ,[1, 1, 0, 0, 1, 1, 1]]
    
    print $ cover board

    end <- getCurrentTime
    print $ diffUTCTime end start




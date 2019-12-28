
module Picnic (countPairings) where


import Data.List


areFriends :: [[Bool]]
areFriends = [[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 0
             ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 1
             ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 2
             ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 3
             ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 4
             ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 5
             ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 6
             ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 7
             ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 8
             ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True]]-- 9


countPairings :: [Bool] -> Int
countPairings taken = do
    case elemIndex False taken of
      Nothing   -> 1
      Just firstFree ->
          sumLoop [firstFree+1 .. n] $ \ pairWith -> 
              case (not $ taken!!pairWith) && areFriends!!firstFree!!pairWith of
                True  -> countPairings [if i == firstFree || i == pairWith 
                                          then True 
                                          else t 
                                            | (i, t) <- zip [0..n] taken]
                False -> 0  

    where 
        n = (length taken) - 1

sumLoop :: [Int] -> (Int -> Int) -> Int
sumLoop range = sum . (flip map range)



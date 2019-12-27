
module Picnic where


    import Control.Monad
    import Data.List
    import Debug.Trace


    randomFriends :: [[Bool]]
    randomFriends = [[ True, False, False,  True,  True,  True,  True,  True, False,  True] -- 0
                    ,[ True, False,  True, False,  True, False,  True, False, False, False] -- 1
                    ,[False, False,  True, False, False, False, False, False, False, False] -- 2
                    ,[False, False,  True, False, False,  True, False, False, False,  True] -- 3
                    ,[False,  True,  True, False,  True, False,  True, False,  True,  True] -- 4
                    ,[ True,  True,  True, False,  True,  True, False,  True, False, False] -- 5
                    ,[False, False,  True,  True, False, False,  True,  True,  True,  True] -- 6
                    ,[False, False,  True,  True,  True, False,  True,  True, False, False] -- 7
                    ,[ True, False, False, False, False, False, False, False, False, False] -- 8
                    ,[ True, False,  True,  True,  True, False,  True, False,  True,  True] -- 9
                    ]


    allFriends :: [[Bool]]
    allFriends = [[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 0
                 ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 1
                 ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 2
                 ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 3
                 ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 4
                 ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 5
                 ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 6
                 ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 7
                 ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 8
                 ,[ True,  True,  True,  True,  True,  True,  True,  True,  True,  True] -- 9
                 ]


    areFriends = allFriends

    countPairings :: [Bool] -> Maybe Int
    countPairings taken = do
        let firstFree = elemIndex False taken
        case firstFree of
          Nothing   -> return 1
          Just firstFree' ->
              fmap sum $ forM [firstFree'+1..n] $ \ pairWith -> do
                  case (not $ taken!!pairWith) && (areFriends!!firstFree'!!pairWith) of
                    True  -> countPairings [if i == firstFree' || i == pairWith 
                                              then True 
                                              else t 
                                                | (i, t) <- zip [0..n] taken]
                    False -> return 0  
        where 
            n = (length taken) - 1



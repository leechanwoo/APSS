

module TravelingSales where


import Debug.Trace
import Control.Monad

type Dists = [[Float]]


n :: Int
n = 4

dists :: Dists
dists = [[0.0, 0.2, 0.3, 0.4, 0.1]
        ,[0.2, 0.0, 0.5, 0.1, 0.5]
        ,[0.3, 0.5, 0.0, 0.2, 0.2]
        ,[0.4, 0.1, 0.2, 0.0, 0.1]
        ,[0.1, 0.5, 0.2, 0.1, 0.0]]



shortestPath :: [Int] -> [Bool] -> Float -> Float
shortestPath path visited currentLength 
  | length path == n = 
      currentLength 
      + dists!!(head path)!!(last path)
  | otherwise = 
      minimum . flip map (zip [0..] visited) $ \(next, visited') -> 
          case visited' of 
            True -> 999.0 
            _ -> do 
                let newVisited = 
                        take next visited
                        ++ [True] 
                        ++ (tail . drop next $ visited) 
                let newPath = path ++ [next] 
                let newLength = 
                        currentLength 
                        + dists!!(last path)!!next

                shortestPath newPath newVisited newLength





module BoardCover where

import Data.List


coverType :: [[(Int, Int)]]
coverType = [[(0, 0), (1, 0), (0, 1)]
            ,[(0, 0), (1, 0), (1, 1)]
            ,[(0, 0), (0, 1), (1, 1)]
            ,[(0, 0), (1, 0), (1,-1)]]


enumerate :: [a] -> [(Int, a)]
enumerate = zip [0..]

set :: [[Int]] -> Int -> Int -> Int -> Int -> Int -> Maybe [[Int]]
set board _ _ _ _ 3 = return $ board
set board y x blockType delta i = do 
    let (dy, dx) = coverType!!blockType!!i
        (ny, nx) = (y+dy, x+dx)

    if ny < 0 
       || ny >= (length board) 
       || nx < 0 
       || nx >= (length . head $ board)
       then Nothing
       else if (board!!ny!!nx + delta) > 1
           then Nothing
           else do 
               let (fys, (dys:sys)) = splitAt ny board 
                   (fxs, (dxs:sxs)) = splitAt nx dys 
                   board' = fys ++ [fxs ++ [dxs + delta] ++ sxs] ++ sys
               set board' y x blockType delta (i+1)



cover :: [[Int]] -> Int
cover board = do
    case searchSpace board 0 of
      (-1, -1) -> 1
      ( y,  x) ->  count $ \tp -> 
          case set board y x tp 1 0 of
            Nothing       -> 0
            Just (board') -> cover board' 
    where
        count = sum . (flip map [0..3])



searchSpace :: [[Int]] -> Int -> (Int, Int)
searchSpace [] _         = (-1, -1)
searchSpace (y:board) yi = case elemIndex 0 y of 
                            Nothing   -> searchSpace board (yi+1)
                            Just (xi) -> (yi, xi)
    


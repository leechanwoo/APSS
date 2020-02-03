

module QuadTreeFlip where

import Data.List
import Debug.Trace
import Control.Monad.Trans.State

type Pixel = Char
type Image = [[Pixel]]
type Code = String
type Size = Int


decompress :: Size -> State Code Image
decompress size = read >>= \x -> 
    case x of 'x' -> mergeImage 
                  <$> decompress hsize 
                  <*> decompress hsize 
                  <*> decompress hsize 
                  <*> decompress hsize 
              'w' -> return $ draw size ' '
              'b' -> return $ draw size 'X'
              _   -> return $ draw size '*'
   where uncons (x:xs) = (x, xs) 
         read = state uncons
         hsize = size `div` 2

draw :: Size -> Char -> Image
draw size fill = [[fill | _ <- [1..size]] | _ <- [1..size]]


mergeImage :: Image -> Image -> Image -> Image -> Image
mergeImage imga imgb imgc imgd = 
    (transpose $ transpose imga ++ transpose imgb) ++ 
        (transpose $ transpose imgc ++ transpose imgd)



module QuadTreeFlip where

import Data.List
import Debug.Trace
import Control.Monad.Trans.State

type Pixel = Char
type Image = [[Pixel]]
type Code = String
type Size = Int


flipCode :: State Code Code
flipCode = read >>= \x ->
    case x of 'x' -> mergeCode 
                  <$> flipCode 
                  <*> flipCode 
                  <*> flipCode 
                  <*> flipCode 
              'w' -> return $ "w"
              'b' -> return $ "b"
  where uncons (x:xs) = (x, xs)
        read = state uncons


mergeCode :: Code -> Code -> Code -> Code -> Code
mergeCode c1 c2 c3 c4 = "x" ++ c3 ++ c4 ++ c1 ++ c2


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


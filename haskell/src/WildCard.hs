
module WildCard where

import Debug.Trace
import Data.List

type Pattern = String
type Patterns = [String]


rmWC :: Pattern -> String
rmWC [] = []
rmWC ('*':ss) = rmWC ss
rmWC (s:ss) = s : rmWC ss


regex :: Pattern -> String -> Bool
regex p ss 
  | elem '*' p = not . null $ filter (match . rmWC $ p) $ subsequences ss
  | otherwise = match p ss 



match :: Pattern -> String -> Bool
match [] [] = True
match [] _ = False
match _ [] = False
match ('?':ps) (s:ss) = match ps ss
match (p:ps) (s:ss) = p == s && match ps ss




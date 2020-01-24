
module ClockAlign where

import Control.Monad
import Debug.Trace

type Links = [[Bool]]
type Clocks = [Clock]
type Switch = Int

data Clock = T | R | B | L  deriving (Eq, Ord, Show, Read, Enum, Bounded)

linked :: Links
linked = [ [True , True , True , False, False, False, False, False, False, False, False, False, False, False, False, False] -- 0
         , [False, False, False, True , False, False, False, True , False, True , False, True , False, False, False, False] -- 1
         , [False, False, False, False, True , False, False, False, False, False, True , False, False, False, True , True ] -- 2
         , [True , False, False, False, True , True , True , True , False, False, False, False, False, False, False, False] -- 3
         , [False, False, False, False, False, False, True , True , True , False, True , False, True , False, False, False] -- 4
         , [True , False, True , False, False, False, False, False, False, False, False, False, False, False, True , True ] -- 5
         , [False, False, False, True , False, False, False, False, False, False, False, False, False, False, True , True ] -- 6
         , [False, False, False, False, True , True , False, True , False, False, False, False, False, False, True , True ] -- 7
         , [False, True , True , True , True , True , False, False, False, False, False, False, False, False, False, False] -- 8
         , [False, False, False, True , True , True , False, False, False, True , False, False, False, True , False, False]] --9



int2clock :: [Int] -> Clocks
int2clock []        = []
int2clock (12:ints) = T:int2clock ints
int2clock ( 3:ints) = R:int2clock ints
int2clock ( 6:ints) = B:int2clock ints
int2clock ( 9:ints) = L:int2clock ints
int2clock ( _:ints) = []


solve :: [Int] -> Int
solve clocks = solve' 0 (int2clock clocks)

solve' :: Int -> Clocks -> Int
solve' 10     clocks = if aligned clocks then 0 else 9999
solve' switch clocks = minimum $ flip map [0..3] $ \cnt -> 
    cnt + solve' (switch+1) (push switch cnt clocks)

push :: Switch -> Int -> Clocks -> Clocks
push switch 0 clocks = clocks
push switch cnt clocks = 
    push switch (cnt-1) [
    if pushed 
       then rot clock 
       else clock 
         | (clock, pushed) <- clockPushed] 

    where
        clockPushed = zip clocks (linked!!switch)
        
aligned :: Clocks -> Bool
aligned clocks = all (==T) clocks


rot :: Clock -> Clock
rot L = T
rot c = succ c



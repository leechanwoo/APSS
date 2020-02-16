
module FibonacciMemo (naiveFib, fibMemo)  where 

import Data.Function (fix)

naiveFib :: Int -> Integer
naiveFib 0 = 0
naiveFib 1 = 1
naiveFib n = naiveFib (n-1) + naiveFib (n-2)

memoize :: (Int -> a) -> (Int -> a)
memoize f = (map f [0..] !!)

fib :: (Int -> Integer) -> Int -> Integer
fib f 0 = 0 
fib f 1 = 1 
fib f n = f (n-1) + f (n-2)


fibMemo :: Int -> Integer
fibMemo = fix (memoize . fib)


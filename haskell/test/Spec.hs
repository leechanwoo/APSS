
import Control.Monad

newtype State s a = State { runState :: s -> (a, s) }
-- runState :: State s a -> (s -> (a, s))

instance Functor (State a) where
    fmap = Control.Monad.liftM

instance Applicative (State a) where
    pure = return 
    (<*>) = Control.Monad.ap


instance Monad (State a) where
    return a = State $ \s -> (a, s)

    -- (>>=) :: State s a -> (a -> State s b) -> State s b
    State act >>= k = State $ \s ->
        let (a, s') = act s 
        in runState (k a) s'
         
        -- k :: State s 
        -- a :: a
        --


main :: IO ()
main = print $ "hello world"

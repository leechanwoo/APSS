
### Sum

sum numbers from 1 to n 

```haskell

module Sum (recSum) where

recSum :: Int -> Int
recSum 0 = 0
recSum n = n + recSum (n-1)

```

```rust
pub fn recursive_sum(n: i32) -> i32 {
    match n {
        1 => return 1,
        n => n + recursive_sum(n-1)
    }
}

```


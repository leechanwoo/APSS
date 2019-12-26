
pub fn recursive_sum(n: i32) -> i32 {
    match n {
        1 => return 1,
        n => n + recursive_sum(n-1)
    }
}


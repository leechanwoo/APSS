

const ARE_FRIENDS: [[bool; 10]; 10] = [
    [true, true, true, true, true, true, true, true, true, true], // 0
    [true, true, true, true, true, true, true, true, true, true], // 1
    [true, true, true, true, true, true, true, true, true, true], // 2
    [true, true, true, true, true, true, true, true, true, true], // 3
    [true, true, true, true, true, true, true, true, true, true], // 4
    [true, true, true, true, true, true, true, true, true, true], // 5
    [true, true, true, true, true, true, true, true, true, true], // 6
    [true, true, true, true, true, true, true, true, true, true], // 7
    [true, true, true, true, true, true, true, true, true, true], // 8
    [true, true, true, true, true, true, true, true, true, true], // 9
];


pub fn count_pairings(taken: Vec<bool>) -> usize {
    let first_free = taken.iter().position(|&e| e == false);
    match first_free {
        None             => 1,
        Some(first_free) => (first_free+1..taken.len())
            .map(|pair_with| 
                match (taken[pair_with], ARE_FRIENDS[first_free][pair_with]) { 
                    (has_pair, is_friend ) if !has_pair && is_friend => { 
                        let mut new_taken = taken.clone();
                        new_taken[first_free] = true;
                        new_taken[pair_with] = true;
                        count_pairings(new_taken)
                    }, // match
                    _ => 0 
                }) // map 
            .sum(),
    } // match 
}


const BOARD : [[char; 5];5] = [['U', 'R', 'L', 'P', 'M'], 
                              ['X', 'P', 'R', 'E', 'T'],
                              ['G', 'I', 'A', 'E', 'T'],
                              ['X', 'T', 'N', 'Z', 'Y'],
                              ['X', 'O', 'Q', 'R', 'S']];

const DX : [i32; 8] = [-1, -1, -1, 1, 1, 1, 0, 0];
const DY : [i32; 8] = [-1, 0, 1, -1, 0, 1, -1, 1];

pub fn has_word(y : i32, x : i32, word : Vec<char>) -> bool {
    match (x, y) {
        (x, y) if !in_range(y, x)            => return false,
        (x, y) if check_word(y, x, word[0])  => return false,
        (_, _) if check_length(&word)        => return true,
        (x, y) if search_board(y, x, word)   => return true,
        _                                    => return false,
    }
}

fn in_range(y : i32, x : i32) -> bool {
    0 <= y && y < 5 && 0 <= x && x < 5
}

fn check_word(y : i32, x : i32, word : char) -> bool {
    BOARD[y as usize][x as usize] != word
}

fn check_length(word : &Vec<char>) -> bool {
    word.len() == 1
}

fn search_board(y : i32, x : i32, word : Vec<char>) -> bool {
    DX.iter()
        .zip(DY.iter())
        .map(|(dx, dy)| { 
            has_word(y+dy, x+dx, word[1..].to_vec())
        })
    .fold(false, |a, b| a || b)
}





enum Offset {
    Neg(usize),
    Pos(usize),
}

const COVERTYPE: [[(Offset, Offset); 3]; 4] = [
    [(Offset::Pos(0), Offset::Pos(0)), (Offset::Pos(1), Offset::Pos(0)), (Offset::Pos(0), Offset::Pos(1))], 
    [(Offset::Pos(0), Offset::Pos(0)), (Offset::Pos(0), Offset::Pos(1)), (Offset::Pos(1), Offset::Pos(1))], 
    [(Offset::Pos(0), Offset::Pos(0)), (Offset::Pos(1), Offset::Pos(0)), (Offset::Pos(1), Offset::Pos(1))], 
    [(Offset::Pos(0), Offset::Pos(0)), (Offset::Pos(1), Offset::Pos(0)), (Offset::Pos(1), Offset::Neg(1))]];


pub fn cover(board: [[i32; 10]; 8]) -> usize {
    match search_space(board) {
        None => 1,
        Some((y, x)) => (0..4)
            .map(|btype| match set(board, y, x, btype, 1, 0) { 
                None => 0, 
                Some(new_board) => cover(new_board)
            }) 
            .sum() 
    }
}


fn search_space(board: [[i32; 10]; 8]) -> Option<(usize, usize)> {
    for (y, xs) in board.iter().enumerate() {
        match xs.iter().position(|&x| x == 0 ) {
            None => continue,
            Some(x) => return Some((y, x))
        }
    }
    None
}


fn set(board: [[i32; 10]; 8], 
       y: usize, 
       x: usize, 
       btype: usize, 
       delta: i32,
       i: usize
) -> Option<[[i32; 10]; 8]>{

    match i {
        i if i >= 3 => Some(board),
        i => {
            let (ny, nx) = match COVERTYPE[btype][i] {
                (Offset::Pos(dy), Offset::Pos(dx)) => (y.checked_add(dy), x.checked_add(dx)),
                (Offset::Neg(dy), Offset::Pos(dx)) => (y.checked_sub(dy), x.checked_add(dx)),
                (Offset::Pos(dy), Offset::Neg(dx)) => (y.checked_add(dy), x.checked_sub(dx)),
                (Offset::Neg(dy), Offset::Neg(dx)) => (y.checked_sub(dy), x.checked_sub(dx)),
            };

            match (ny, nx) {
                (None, None) | (None, _) | (_, None) => return None,
                (Some(ny), Some(nx)) => match (ny, nx) {
                    (ny, nx) if ny >= board.len() || nx >= board[0].len() => None,
                    (ny, nx) if board[ny][nx] + delta > 1 => None,
                    (ny, nx) => {
                        let mut new_board = board.clone();
                        new_board[ny][nx] += 1;
                        set(new_board, y, x, btype, delta, i+1)
                    }
                }
            }
        }
    } // match i 
}







const COVERTYPE: [[(i32, i32); 3]; 4] = [[(0, 0), (1, 0), (0, 1)],
                                         [(0, 0), (1, 0), (1, 1)],
                                         [(0, 0), (0, 1), (1, 1)],
                                         [(0, 0), (1, 0), (1,-1)]];



pub fn cover(board: [[i32; 10]; 8]) -> usize {
    match search_space(board) {
        None => 1,
        Some((y, x)) => (0..4).map(|btype| 
            match set(board, y, x, btype, 1, 0) { 
                None => 0, 
                Some(new_board) => cover(new_board), 
            }).sum() 
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
           i: usize) -> Option<[[i32; 10]; 8]>{

    if i >= 3 {

        Some(board)

    } else {

        let (dy, dx) = COVERTYPE[btype][i];
        let (ny, nx) = match (dy, dx) {
            (-1, dx) => match y {
                y if y < 1 => return None,
                _ => (y-1 as usize, x+dx as usize)
            }
            (dy, -1) => match x {
                x if x < 1 => return None,
                _ => (y+dy as usize, x-1 as usize)
            },
            (dy, dx) => (y+dy as usize, x+dx as usize),
        };

        if ny >= board.len() || nx >= board[0].len() {
            None
        } else if board[ny][nx] + delta > 1 {
            None
        } else {
            let mut new_board = board.clone();
            new_board[ny][nx] += 1;
            set(new_board, y, x, btype, delta, i+1)
        }
    } // if.. else
}




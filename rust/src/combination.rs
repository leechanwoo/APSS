
pub fn pick(n : i32, picked : Vec<i32>, to_pick: i32) {
    match to_pick {
        0       => print_picked(picked),
        to_pick => {
            let smallest = match picked.last() {   
                None    => 0,
                Some(x) => x + 1
            };

            (smallest..n).for_each(|next|  
                pick(n, 
                    [picked.clone(), vec![next]].concat(),
                    to_pick-1
                    )
                ) 
        } 
    } 
}


fn print_picked(picked : Vec<i32>) {
    match picked[..] {
        [] => println!("picked verctor is empty"),
        _  => {
            picked.iter().for_each(|p| print!("{} ", p));
            print!("\n")
        }
    }
}


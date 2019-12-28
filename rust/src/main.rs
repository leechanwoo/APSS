
use std::time::Duration;
use cpu_time::ProcessTime;

//mod sum;
//mod combination;
//mod bubble;
//mod picnic;
mod boardcover;

fn main() {
    let start = ProcessTime::try_now()
        .expect("Getting process time failed!");


    //print!("{}\n", sum::recursive_sum(100));
    //combination::pick(100, Vec::new(), 3);
    //println!("{}", bubble::has_word(1, 1, vec!['P', 'R', 'E', 'T', 'T', 'Y']));
    //println!("result: {}", picnic::count_pairings(vec![false; 10]));
    println!("{}", boardcover::cover([[1,1,1,1,1,1,1,1,1,1], 
                                      [1,0,0,0,0,0,0,0,0,1],
                                      [1,0,0,0,0,0,0,0,0,1],
                                      [1,0,0,0,0,0,0,0,0,1],
                                      [1,0,0,0,0,0,0,0,0,1],
                                      [1,0,0,0,0,0,0,0,0,1],
                                      [1,0,0,0,0,0,0,0,0,1],
                                      [1,1,1,1,1,1,1,1,1,1]]));


    let cpu_time: Duration = start.try_elapsed()
        .expect("Getting process time failed!!");

    println!("\nProcess finished");
    println!("Process time: {:?}\n", cpu_time);

}




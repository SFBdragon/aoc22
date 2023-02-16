
const STACKS: [&str; 9] = [
    "CQB",
    "ZWQR",
    "VLRMB",
    "WTVHZC",
    "GVNBHZD",
    "QVFJCPNH",
    "SZWRTGD",
    "PZWBNMGC",
    "PFQWMBJN",
];

fn main() {
    let mut stacks = STACKS.map(|x| x.to_string().into_bytes());
    stacks.iter_mut().for_each(|x| x.reverse());

    let insts = String::from_utf8(std::fs::read("05_data").unwrap()).unwrap();

    for line in insts.lines() {
        let mut split = line.split_ascii_whitespace();
        split.next().unwrap();
        let count = split.next().unwrap().parse::<usize>().unwrap();
        split.next().unwrap();
        let from = split.next().unwrap().parse::<usize>().unwrap() - 1;
        split.next().unwrap();
        let to = split.next().unwrap().parse::<usize>().unwrap() - 1;

        let index = stacks[from].len() - count;
        let crates = stacks[from][index..].to_owned();
        stacks[to].extend(crates.iter().rev());
        stacks[from].truncate(index);
    }

    for s in stacks {
        print!("{}", *s.last().unwrap() as char);
    }
}
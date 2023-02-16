use std::collections::HashMap;




fn main() {
    let cmds = String::from_utf8(std::fs::read("06_data").unwrap()).unwrap();

    // track the current directory as a stack
    let mut cd = Vec::<String>::new();
    // track sizes in a map of directories
    let mut dirs = HashMap::<String, usize, _>::new();
    // track whether to expect ls output (anti-bugs)
    let mut ls = false;

    for cmd in cmds.lines() {
        //dbg!(&cmd);
        let mut cmd = cmd.trim().split_ascii_whitespace();


        let fst = cmd.next().unwrap();

        if fst == "$" {
            ls = false;

            match cmd.next().unwrap() {
                "cd" => {
                    let d = cmd.next().unwrap();

                    if d == ".." {
                        cd.pop().unwrap();
                    } else {
                        cd.push(cd.last().map_or("".to_string(), |l| l.clone()) + "/" + d);
                    }
                },
                "ls" => ls = true,
                _ => panic!(),
            }

        } else {
            assert!(ls);

            // ignore dir info from ls
            if fst != "dir" {
                let size = fst.parse::<usize>().unwrap();
                for d in cd.iter() {
                    dirs.entry(d.clone()).and_modify(|x| *x += size).or_insert(size);
                }
            }
        }
    }
    
    print!("{}", dirs.values().fold(0, |a, &x| if x <= 100000 { a + x } else { a }));
}
import Data.Array

xyzToPts a = case a of
    'X' -> 1
    'Y' -> 2
    'Z' -> 3

abcToXyz a = case a of
    'A' -> 'X'
    'B' -> 'Y'
    'C' -> 'Z'

abcToXyzLose a = case a of
    'A' -> 'Z'
    'B' -> 'X'
    'C' -> 'Y'


ptsStratAcc strat acc = case strat of
    ((abc, xyz):_) -> ptsStratAcc (tail strat) $ acc + xyzToPts xyz + if abcToXyz abc == xyz
            then 3
        else if abcToXyzLose abc == xyz
            then 0
        else     6
    [] -> acc



main = do
    contents <- readFile "02_data"
    let abc = filter (`elem` "ABC") contents
    let xyz = filter (`elem` "XYZ") contents
    print $ ptsStratAcc (zip abc xyz) 0
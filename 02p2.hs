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

abcToXyzWin a = case a of
    'A' -> 'Y'
    'B' -> 'Z'
    'C' -> 'X'

xyzToVic a = case a of
    'X' -> 0
    'Y' -> 3
    'Z' -> 6


ptsStratAcc strat acc = case strat of
    ((abc, xyz):_) -> ptsStratAcc (tail strat) $ acc + xyzToVic xyz + xyzToPts (case xyz of
        'X' -> abcToXyzLose abc
        'Y' -> abcToXyz abc
        'Z' -> abcToXyzWin abc)
    [] -> acc



main = do
    contents <- readFile "02_data"
    let abc = filter (`elem` "ABC") contents
    let xyz = filter (`elem` "XYZ") contents
    print $ ptsStratAcc (zip abc xyz) 0
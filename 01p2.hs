import Data.List

splitSnacks snack elf acc
    | null elf = acc + (read snack :: Integer)
    | last elf == '\n' = splitSnacks [] (init elf) (acc + (if null snack then 0 else read snack :: Integer))
    | otherwise = splitSnacks (last elf : snack) (init elf) acc

splitElves elf input best
    | null input = newBest
    | last input == ('\n', '\n') = splitElves [] (init $ init input) newBest
    | otherwise = splitElves (snd (last input) : elf) (init input) best
    where newBest = tail . sort $ splitSnacks [] elf 0 : best

main = do  
    contents <- readFile "01_data"
    print . sum $ splitElves [] (zip ('\n' : contents) contents) [-1, -1, -1]

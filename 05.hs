import Data.List.Split.Internals ( splitOn )
import Data.Char (isAlpha)

stacks = [
                                 ['C', 'Q', 'B'],
                            ['Z', 'W', 'Q', 'R'],
                       ['V', 'L', 'R', 'M', 'B'],
                  ['W', 'T', 'V', 'H', 'Z', 'C'],
             ['G', 'V', 'N', 'B', 'H', 'Z', 'D'],
        ['Q', 'V', 'F', 'L', 'C', 'P', 'N', 'H'],
             ['S', 'Z', 'W', 'R', 'T', 'G', 'D'],
        ['P', 'Z', 'W', 'B', 'N', 'M', 'G', 'C'],
        ['P', 'F', 'Q', 'W', 'M', 'B', 'J', 'N']
    ]

doShit insts stacks
    | null insts = stacks
    | otherwise = let
               inst = head insts
               move = read (head inst) :: Int
               from = read (inst !! 1) :: Int
               to   = read (inst !! 2) :: Int
          in
               doShit (tail insts) [ 
                    if snd s == from then
                         drop move $ fst s
                    else if snd s == to then
                         reverse (drop move $ stacks !! (from - 1)) ++ fst s
                    else fst s
               | s <- zip stacks [1..] ]

main = do
    contents <- readFile "05_data"
    print $ doShit (map (filter (/= "") . splitOn " " . filter (not . isAlpha)) $ filter (/= "") (splitOn "\n" contents)) stacks

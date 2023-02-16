import Data.Char
import Data.List.Split
import Data.Foldable
import Data.Maybe (fromJust)
import Data.List

itemToPrio a
    | ascii >= ord 'a' = ascii - ord 'a' + 1
    | otherwise        = ascii - ord 'A' + 27
    where ascii = ord a

findCommon3 a =
    last $ filter (`elem` (a !! 2)) $ filter (`elem` (a !! 1)) $ head a

groupEveryThird acc a
    | null a        = acc
    | length a <= 2 = error "ono"
    | otherwise     = [a !! 2, a !! 1, head a] : groupEveryThird acc (drop 3 a)

main = do
    contents <- readFile "03_data"
    print $ sum $ map (itemToPrio . findCommon3) $ groupEveryThird [] $ filter (/= "") (splitOn "\n" contents)
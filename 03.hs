import Data.Char
import Data.List.Split
import Data.Foldable
import Data.Maybe (fromJust)

itemToPrio a
    | ascii >= ord 'a' = ascii - ord 'a' + 1
    | otherwise        = ascii - ord 'A' + 27
    where ascii = ord a

findDupe a =
    let (first, second) = splitAt (length a `div` 2) a in
    fromJust $ find (`elem` second) first

main = do
    contents <- readFile "03_data"
    print $ sum $ map (itemToPrio . findDupe) $ filter (/= "") (splitOn "\n" contents)
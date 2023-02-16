import Data.List.Split ( splitOn )
import GHC.Utils.Misc (count)

isContainer a =
    let 
        b = splitOn "," a
        range1 = splitOn "-" $ head b
        range2 = splitOn "-" $ last b
        r11 = read (head range1) :: Integer
        r12 = read (last range1) :: Integer
        r21 = read (head range2) :: Integer
        r22 = read (last range2) :: Integer
    in (r11 >= r21 && r11 <= r22) || (r12 >= r21 && r12 <= r22) || (r21 >= r11 && r21 <= r12) || (r22 >= r11 && r22 <= r12)



main = do
    contents <- readFile "04_data"
    print $ count isContainer $ filter (/= "") (splitOn "\n" contents)
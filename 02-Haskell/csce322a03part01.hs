import Prelude
import System.Environment ( getArgs )
import Data.List
import Helpers

-- The main method that will be used for testing / command line access
main = do
     args <- getArgs
     filename <- readFile (head args)
     (moves,maze) <- readMazeFile filename
     print "Result"
     printMaze (onePlayerOneSlide maze (head moves))

-- YOUR CODE SHOULD COME AFTER THIS POINT
onePlayerOneSlide :: [[Char]] -> Char -> [[Char]]
onePlayerOneSlide ma mo = movePlayer ma mo 

getTheRowOrColumnOfPlayer :: [[Char]] -> Char -> [Char]
getTheRowOrColumnOfPlayer ma mo
    | mo == 'l' = getRow ma row_coor
    | mo == 'r' = getRow ma row_coor
    | mo == 'u' = getCol ma col_coor
    | mo == 'd' = getCol ma col_coor

    where
        row_coor = fst(head (find2D '1' ma))
        col_coor = snd(head (find2D '1' ma))

search :: Char -> [Char] -> [Int]
search _ [] = []
search e (h:t)
    | e == h = [0] ++ (map (+ 1) (search e t))
    | otherwise = (map (+ 1) (search e t))

find2D :: Char -> [[Char]] -> [(Int, Int)]
find2D _ [] = []
find2D el (row:rows) = add ++ next
    where   first = search el row
            add = [(0,c)|c<-first]
            rest = (find2D el rows)
            next = [(r,c)|(a,c)<-rest, let r=a+1]

-- gets the elements of corresponding rows

getRow :: [[Char]] -> Int -> [Char]
getRow [] _ = []
getRow (row:rows) 0 = row
getRow (row:rows) counter = getRow (rows) (counter - 1)

-- gets the elements of corresponding columns 

getCol :: [[Char]] -> Int -> [Char]
getCol [] _ = []
getCol (row:rows) c = (getItem row c):(getCol rows c)

getItem :: [Char] -> Int -> Char
getItem (h:t) 0 = h
getItem (h:t) i = getItem t (i-1)

-- move left and right and up and down

movePlayer :: [[Char]] -> Char -> [[Char]]
movePlayer maze move 
    | move == 'l' = replaceRow maze x_coordinate (reverseList (moveThePlayer (reverseList elements) '1' ))  
    | move == 'r' = replaceRow maze x_coordinate (moveThePlayer elements '1') 
    | move == 'u' = replaceColumn maze y_coordinate (reverseList (moveThePlayer (reverseList elements) '1' )) 
    | move == 'd' = replaceColumn maze y_coordinate (moveThePlayer elements '1') 
    where
        elements = getTheRowOrColumnOfPlayer maze move 
        y_coordinate = snd(head(find2D '1' maze))
        x_coordinate = fst(head(find2D '1' maze))

moveThePlayer :: [Char] -> Char -> [Char]
moveThePlayer (y : x : xs) e 
    | y == e && x /='x' && x /= 'g' = moveThePlayer (x : y :xs) e
    | y == e && x == 'g' = ('-' : y : xs) 
moveThePlayer (x:xs) e = x : moveThePlayer xs e
moveThePlayer [] _ = []

-- reverse the list 

reverseList :: [Char] -> [Char]
reverseList [] = []
reverseList (element:rest) = (reverseList rest) ++ [element]

set :: Int -> Char -> [Char] -> [Char]
set 0 el (h:t) = (el:t)
set n el (h:t) = h:(set (n-1) el t)

-- replace row and columns

replaceColumn :: [[Char]] -> Int -> [Char] -> [[Char]]
replaceColumn [] _ _ = []
replaceColumn (row:rows) c (h:t) = (set c h row):(replaceColumn rows c t)

replaceRow :: [[Char]] -> Int -> [Char] -> [[Char]]
replaceRow [] _ _ = []
replaceRow (row:rows) 0 rowValue = (rowValue : rows)
replaceRow (row:rows) r rowValue = (row) : replaceRow rows (r-1) rowValue


    
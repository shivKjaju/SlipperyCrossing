import Prelude
import System.Environment ( getArgs )
import Data.List
import Data.Char
import Helpers
  
-- The main method that will be used for testing / command line access
main = do
     args <- getArgs
     filename <- readFile (head args)
     (moves,maze) <- readMazeFile filename
     print "Result"
     printMaze (manyPlayersManySlides maze moves)

-- YOUR CODE SHOULD COME AFTER THIS POINT
manyPlayersManySlides :: [[Char]] -> [Char] -> [[Char]]
manyPlayersManySlides ma mos = playerMaker ma mos

controller2 :: [[Char]] -> [Char] -> [Char] -> [[Char]]
controller2  maze [] _ = maze
controller2 maze (h:t) (player:theTail) = controller2 (movePlayer maze h player) t (theTail ++ [player]) 
    
playerMaker :: [[Char]] -> [Char] -> [[Char]]
playerMaker maze move = controller2 maze move (sort(convertTo1D (filterAgain maze)))

-- loop through the given maze; find the players make a [char] of players

loopThrough :: [[Char]] -> [[Char]]
loopThrough [] = []
loopThrough (row:rows)  = ((filter (\x -> x/='x' && x/='-' && x/='g') row) : loopThrough rows) 

filterAgain :: [[Char]] -> [[Char]]
fiterAgain [] = []
filterAgain maze = filter (not .null) (loopThrough maze)

convertTo1D :: [[Char]] -> [Char]
convertTo1D [] = []
convertTo1D (row:rows) = (row) ++ (convertTo1D rows)


-- handles the movement of the player

movePlayer :: [[Char]] -> Char -> Char -> [[Char]]
movePlayer maze move player 
    | move == 'l' && goalFound == 'y' = replaceRow maze x_coordinate (reverseList (moveThePlayer (reverseList elements) player ))  
    | move == 'r' && goalFound == 'y' = replaceRow maze x_coordinate (moveThePlayer elements player ) 
    | move == 'u' && goalFound == 'y' = replaceColumn maze y_coordinate (reverseList (moveThePlayer (reverseList elements) player )) 
    | move == 'd' && goalFound == 'y' = replaceColumn maze y_coordinate (moveThePlayer elements player) 
    | otherwise = maze
    where
        elements = getTheRowOrColumnOfPlayer maze move player
        y_coordinate = snd(head(find2D player maze))
        x_coordinate = fst(head(find2D player maze))
        goalFound = (findGIn2D 'g' maze 'n')


moveThePlayer :: [Char] -> Char -> [Char]
moveThePlayer (elementWeWant : secondElement : xs) e 
    | elementWeWant == e && secondElement == '-' = moveThePlayer (secondElement : elementWeWant :xs) e
    | elementWeWant == e && secondElement == 'g' = ('-' : elementWeWant : xs) 
moveThePlayer (secondElement:xs) e = secondElement : moveThePlayer xs e
moveThePlayer [] _ = []

--  

getTheRowOrColumnOfPlayer :: [[Char]] -> Char -> Char -> [Char]
getTheRowOrColumnOfPlayer ma mo player
    | mo == 'l' = getRow ma row_coor
    | mo == 'r' = getRow ma row_coor
    | mo == 'u' = getCol ma col_coor
    | mo == 'd' = getCol ma col_coor

    where
        row_coor = fst(head (find2D player ma))
        col_coor = snd(head (find2D player ma))


-- get row get column remains the same 

getRow :: [[Char]] -> Int -> [Char]
getRow [] _ = []
getRow (row:rows) 0 = row
getRow (row:rows) counter = getRow (rows) (counter - 1)
            
getCol :: [[Char]] -> Int -> [Char]
getCol [] _ = []
getCol (row:rows) c = (getItem row c):(getCol rows c)
            
getItem :: [Char] -> Int -> Char
getItem (h:t) 0 = h
getItem (h:t) i = getItem t (i-1)

-- finds the coordinate of the player

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

-- reverse the list if up and left move is encountered
    
reverseList :: [Char] -> [Char]
reverseList [] = []
reverseList (element:rest) = (reverseList rest) ++ [element]
    
-- replace the row and column
    
set :: Int -> Char -> [Char] -> [Char]
set 0 el (h:t) = (el:t)
set n el (h:t) = h:(set (n-1) el t)
    
replaceColumn :: [[Char]] -> Int -> [Char] -> [[Char]]
replaceColumn [] _ _ = []
replaceColumn (row:rows) c (h:t) = (set c h row):(replaceColumn rows c t)
    
replaceRow :: [[Char]] -> Int -> [Char] -> [[Char]]
replaceRow [] _ _ = []
replaceRow (row:rows) 0 rowValue = (rowValue : rows)
replaceRow (row:rows) r rowValue = (row) : replaceRow rows (r-1) rowValue

-- check for 'g' after every move of player

searchG :: Char -> [Char] -> Char -> Char
searchG  _ [] placeHolder = placeHolder 
searchG e (h:t) placeHolder
    | e == h = 'y'
    | otherwise = (searchG e t placeHolder)

findGIn2D :: Char -> [[Char]] -> Char -> Char
findGIn2D _ [] placeHolder = placeHolder
findGIn2D el (row:rows) placeHolder =  findGIn2D el rows (searchG el row placeHolder)
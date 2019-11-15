module Helpers
( readMazeFile
, printMaze
) where

import Prelude
import Data.Char

readMazeFile :: String -> IO ([Char],[[Char]])
readMazeFile = readIO

printMaze :: [[Char]] -> IO ()
printMaze [] = do
	       print "END"
printMaze (ro:ros) = do
	  	     print ro
		     printMaze ros


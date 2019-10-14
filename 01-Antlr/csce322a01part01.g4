grammar csce322a01part01;


// rules

mazeGame:  (firsrtMoveandMaze+ endoffile ) | (firstMazeandMove+ endoffile) | endoffile;

firsrtMoveandMaze: sec_begin | sec_title | assign_value | list_begin | symbolInMoves+ | list_end | sec_end | sec_begin | sec_title | assign_value | maze_begin | symbolInMaze+ | maze_end | sec_end ;

firstMazeandMove: sec_begin | sec_title | assign_value | maze_begin | symbolInMaze+ | maze_end | sec_end | sec_begin | sec_title | assign_value | list_begin | symbolInMoves+ | list_end | sec_end ;

symbolInMoves: Move_symbols '_' {System.out.println("Move Symbol: " + $Move_symbols.text);}
             | Move_symbols {System.out.println("Move Symbol: " + $Move_symbols.text);}
             | error
             ;

symbolInMaze: Maze_symbols {System.out.println("Maze Symbol: " + $Maze_symbols.text);}
             | Numerical_symbols {System.out.println("Maze Symbol: " + $Numerical_symbols.text);}
             | rowEnd {System.out.println("Row Ending: " + $rowEnd.text);}
             | error
             ;

rowEnd: Row_end;

error: ERROR {System.out.println("Something on Line " + $ERROR.line + " is Unrecognized."); System.exit(1);};

sec_begin: Section_begin {System.out.println("Section Beginning: " + $Section_begin.text);}
         | error
         ;
sec_title: Section_title {System.out.println("Section Title: " + $Section_title.text);}
         | error
         ;
assign_value: Assign_value {System.out.println("Assign Value: " + $Assign_value.text);}
         | error
         ;
list_begin: List_begin {System.out.println("List Beginning: " + $List_begin.text);}
         | error
         ;
//move_symbol: symbolInMoves {System.out.println("Move Symbol: " + $symbolInMoves.text);}
//         | {System.out.println("move symbol problem");}
//         ;
list_end: List_end {System.out.println("List Ending: " + $List_end.text);}
         | error
         ;
maze_begin: Maze_begin {System.out.println("Maze Beginning: " + $Maze_begin.text);}
         | error
         ;
//maze_symbol: symbolInMaze {System.out.println("Maze Symbol: " + $symbolInMaze.text);}
//         | {System.out.println("maze symbol problem");}
//         ;
//row_end: rowEnd {System.out.println("Row Ending: " + $rowEnd.text);}
//         | {System.out.println("row ending problem");}
//         ;
maze_end: Maze_end {System.out.println("Maze Ending: " + $Maze_end.text);}
         | error
         ;
sec_end: Section_end {System.out.println("Section Ending: " + $Section_end.text);}
         | error
         ;
endoffile: EOF {System.out.println("File Ending");}

         ;
// tokens
Section_begin : '{' ;
Section_title : [A-Z][a-z]+;
Assign_value : '@';
List_begin  : '[';
Move_symbols : 'u'|'d'|'l'|'r';
List_end : ']';
Section_end : '}';
Maze_begin : '(';
Maze_end : ')';
Maze_symbols : '-'|'g'|'x';
Numerical_symbols : [0-9]+;
Row_end : '$';
WS : [ \t\r\n]+ -> skip;
ERROR: .;


grammar csce322a01part02;

@header{
import java.util.*;
import java.io.*;
import java.lang.*;
}

@members {
public int countG = 0;
public int countU = 0;
public int countD = 0;
public int countL = 0;
public int countR = 0;
public int row_counter = 0;
public int countMoveSymbols;
public int countOtherSymbols = 0;
public int countNumericalSymbols = 0;
public int countXSymbols = 0;
public boolean ruleone = false;
public boolean ruletwo = false;
public boolean rulethree = false;
public boolean rulefour = false;
}
// Parser rules
mazeGame : (firsrtMoveandMaze+ endoffile) semanticRules | (firstMazeandMove+ endoffile) semanticRules;


// Lexer rules
firsrtMoveandMaze: sec_begin  sec_title  assign_value  list_begin  symbolInMoves+ list_end  sec_end sec_begin  sec_title  assign_value  maze_begin  symbolInMaze+ maze_end sec_end ;

firstMazeandMove: sec_begin  sec_title  assign_value  maze_begin  symbolInMaze+ maze_end  sec_end  sec_begin  sec_title  assign_value  list_begin  symbolInMoves+ list_end sec_end ;

symbolInMoves: Move_symbols '_' {
                countMoveSymbols++;
                String moveValue = $Move_symbols.text;
                if(moveValue.equals("u"))
                    countU++;
                if(moveValue.equals("d"))
                    countD++;
                if(moveValue.equals("l"))
                    countL++;
                if(moveValue.equals("r"))
                    countR++;
             }
             | Move_symbols
             {
                countMoveSymbols++;
                String moveValue = $Move_symbols.text;
                if(moveValue.equals("u"))
                     countU++;
                if(moveValue.equals("d"))
                     countD++;
                if(moveValue.equals("l"))
                     countL++;
                if(moveValue.equals("r"))
                     countR++;
             }

             ;

symbolInMaze: Maze_symbols {
                String value = $Maze_symbols.text;
                if(value.equals("g"))
                    countG++;

                if(value.equals("x")){
                    countXSymbols++;
                }
                else{
                    countOtherSymbols++;
                }
             }
            | Numerical_symbols {countNumericalSymbols++;} | rowEnd

             ;

rowEnd: Row_end {row_counter++;};

//error: ERROR {System.out.println("Something on Line " + $ERROR.line + " is Unrecognized."); System.exit(1);};

sec_begin: Section_begin

         ;
sec_title: Section_title

         ;
assign_value: Assign_value

         ;
list_begin: List_begin

         ;

list_end: List_end
{
 if(countMoveSymbols <= 4){
                    System.out.println("Something on Line " + $List_end.line + " is Problematic.");
                    System.exit(1);
                }}
 ;
maze_begin: Maze_begin

         ;
maze_end: Maze_end {
    if(row_counter < 6)
    {
        System.out.println("Something on Line " + $Maze_end.line + " is Problematic.");
        System.exit(1);
    }
}
   ;
sec_end: Section_end
         ;
endoffile: EOF ;

//error: ERROR
//{ System.out.println("Something on Line " + $ERROR.line + " is Problematic.");
//  System.exit(1);
//};

semanticRules: {

 if(countNumericalSymbols < 1 || countNumericalSymbols > 4){
    System.out.println("Semantic Violation: Rule 1");
    ruleone = true;
  }

 if(countG > 1){
   System.out.println("Semantic Violation: Rule 2");
    ruletwo = true;
 }

 if(countXSymbols > ((countXSymbols + countOtherSymbols) * .5)){
   System.out.println("Semantic Violation: Rule 3");
    rulethree = true;
 }

 if(!((countU >= 1) && (countD >= 1) && (countL >=1) && (countR >=1))){
   System.out.println("Semantic Violation: Rule 4");
    rulefour = true;
 }

 if (ruleone == false && ruletwo == false && rulethree == false && rulefour == false){
    System.out.println("There are " + countNumericalSymbols +" players.");
 }

};

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
Maze_symbols : '-'|'g'|'x' ;
Numerical_symbols : [0-9]+;
Row_end : '$';
WS : [ \t\r\n]+ -> skip;
//ERROR: .;
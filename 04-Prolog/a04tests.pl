printSequences([]).
printSequences([Sequence|Sequences]):-
    writeln(Sequence),
    printSequences(Sequences).

loadHelpers:-
    	['helpers'],
    	['csce322a04part01'],
	['csce322a04part02'],
	['csce322a04part03'],
	['csce322a04part04'].
    
part01:-
    readMazeGame('part01test01.scm',_,Game),
    writeln(maze),
    printMazeGame(Game),
    colsAndPlayers(Game).
    
part02:-
    readMazeGame('part02test01.scm',_,Game),
    printMazeGame(Game),
    setof(Moves,fewestSlides(Game,Moves),AllMoves),
    writeln(moves),
    printSequences(AllMoves).
    
part04:-
    readMazeGame('part04test01.scm',_,Game),
    printMazeGame(Game),
    noAdvantage(Game).

part03:-
    readMazeGame('part03test01.scm',_,Game),
    printMazeGame(Game),
    goalWall(Game).

colsAndPlayers([Row|Rows]):-
    length(Row, ColLength),
    % print(ColLength),
    continueThroughMaze([Row|Rows], PlayerList),
    length(PlayerList, PlayerLength),
    % print(PlayerLength),
    ((0 is mod(ColLength,2) , 0 is mod(PlayerLength,2));
     (1 is mod(ColLength,2) , 1 is mod(PlayerLength,2))).
    



continueThroughMaze([],[]).
continueThroughMaze([Row|Rows], ListOfPlayers):-
    findPlayersRowWise(Row, ListOfPlayersInRow),
    % print(ListOfPlayersInRow),
    continueThroughMaze(Rows, PlayersInRow),
    % print(PlayersInRow),
    append(ListOfPlayersInRow, PlayersInRow, ListOfPlayers).
    % print(FinalListOfPlayers),


findPlayersRowWise([],[]).
findPlayersRowWise(['x'|T], PlayerHeadCount):- 
    findPlayersRowWise(T, PlayerHeadCount), !.
findPlayersRowWise(['-'|T], PlayerHeadCount):- 
    findPlayersRowWise(T, PlayerHeadCount), !. 
findPlayersRowWise(['g'|T], PlayerHeadCount):-
    findPlayersRowWise(T, PlayerHeadCount), !.
findPlayersRowWise([H|T], [H|PlayerHeadCount]):-
    findPlayersRowWise(T, PlayerHeadCount), !. 






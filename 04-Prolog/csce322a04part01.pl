colsAndPlayers([Row|Rows]):-
    length(Row, ColLength),
    flatten2D([Row|Rows], FlattenMaze),
    filterList('x', FlattenMaze, FlattenMazeNoX),
    filterList('-', FlattenMazeNoX, FlattenMazeNoH),
    filterList('g', FlattenMazeNoH, FlattenMazeNoG),
    sort(FlattenMazeNoG, SortedPlayerList),
    % print(ColLength),
    % continueThroughMaze([Row|Rows], PlayerList),
    length(SortedPlayerList, PlayerLength),
    % print(PlayerLength),
    ((0 is mod(ColLength,2) , 0 is mod(PlayerLength,2));
     (1 is mod(ColLength,2) , 1 is mod(PlayerLength,2))).
    

filterList(A, In, Out) :-
    exclude(=(A), In, Out).

% flatten the 2d maze
flatten2D([],[]).
flatten2D([H|T], FinalList) :- 
    flatten2D(T, NewList),
    append(H, NewList, FinalList).

% continueThroughMaze([],[]).
% continueThroughMaze([Row|Rows], ListOfPlayers):-
%     findPlayersRowWise(Row, ListOfPlayersInRow),
%     % print(ListOfPlayersInRow),
%     continueThroughMaze(Rows, PlayersInRow),
%     % print(PlayersInRow),
%     append(ListOfPlayersInRow, PlayersInRow, ListOfPlayers).
%     % print(FinalListOfPlayers),


% findPlayersRowWise([],[]).
% findPlayersRowWise(['x'|T], PlayerHeadCount):- 
%     findPlayersRowWise(T, PlayerHeadCount), !.
% findPlayersRowWise(['-'|T], PlayerHeadCount):- 
%     findPlayersRowWise(T, PlayerHeadCount), !. 
% findPlayersRowWise(['g'|T], PlayerHeadCount):-
%     findPlayersRowWise(T, PlayerHeadCount), !.
% findPlayersRowWise([H|T], [H|PlayerHeadCount]):-
%     findPlayersRowWise(T, PlayerHeadCount), !. 






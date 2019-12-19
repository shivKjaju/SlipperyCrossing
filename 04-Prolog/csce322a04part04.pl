noAdvantage(Maze):-
    % find the players from Maze --> find the g and player coordinates --> Calculate the distance of players from g 
    flatten2D(Maze, FlattenMaze),
    filterList('x', FlattenMaze, FlattenMazeNoX),
    filterList('-', FlattenMazeNoX, FlattenMazeNoH),
    filterList('g', FlattenMazeNoH, FlattenMazeNoG),
    sort(FlattenMazeNoG, SortedPlayerList),
    find2D(Maze,'g',(Xg,Yg)),
    % print(SortedPlayerList),
    getXCoordinates(Maze,SortedPlayerList,Xvalues),
    getYCoordinates(Maze,SortedPlayerList,Yvalues),
    subtractList(Xvalues,Xg,DifferenceOfXCoor),
    subtractList(Yvalues,Yg,DifferenceOfYCoor),
    squareMaker(DifferenceOfXCoor,SquaredXList),
    squareMaker(DifferenceOfYCoor,SquaredYList),
    distanceCalculator(SquaredXList,SquaredYList,DistanceList),
    find(DistanceList,MinValue,1),
    include(>=(MinValue),DistanceList,LessThanPlayerOneList),
    length(LessThanPlayerOneList,ListLength),
    ListLength > 1.

% get the Player X-Coordinates
getXCoordinates(_,[],[]).
getXCoordinates(Maze,[H|T],ListOfXCoordinates):-
    getXCoordinates(Maze,T,Curr),
    find2D(Maze,H,(XValue,YValue)),
    append([XValue],Curr,ListOfXCoordinates).

%  get the player Y-Coordinates
getYCoordinates(_,[],[]).
getYCoordinates(Maze,[H|T],ListOfYCoordinates):-
    getYCoordinates(Maze,T,CurrList),
    find2D(Maze,H,(XValues,YValues)),
    append([YValues],CurrList,ListOfYCoordinates).

% subtract a number from all list elements
subtractList([],_,[]).
subtractList([H|T], Element, Out):-
    subtractList(T, Element, OutList),
    NewValue is H - Element,
    append([NewValue], OutList, Out).

% square elements of list
squareMaker([],[]).
squareMaker([H|T],SquaredList):-
    squareMaker(T,NewSquaredList),
    NewValue is H^2,
    append([NewValue],NewSquaredList,SquaredList).

% calculate the distance of each player from goal
distanceCalculator([],[],[]).
distanceCalculator([H|T],[Head|Tail],FinalDistanceList):-
    distanceCalculator(T,Tail,NewFinalList),
    SquareRoot is sqrt(H+Head),
    append([SquareRoot],NewFinalList,FinalDistanceList).

% extract list of players from flatten2D
filterList(A, In, Out) :-
    exclude(=(A), In, Out).

% flatten the 2d maze
flatten2D([],[]).
flatten2D([H|T], FinalList) :- 
    flatten2D(T, NewList),
    append(H, NewList, FinalList).

% find coordinates
find([What|_],What,1).
find([_|T],What,Where):-
    find(T,What,WhereT),
    Where is WhereT + 1.

% find2D(ListOfLists,What,Where)
% find2D([Row|Rows],What,(RowL,ColL))
find2D([Row|_],What,(1,C)):-    
    find(Row,What,C).
find2D([_|Rows],What,(R,RowsC)):-    
    find2D(Rows,What,(RowsR,RowsC)),    
    R is RowsR + 1.

    
goalWall(Maze):-
    find2D(Maze, 'g', (RowCoordinate,ColumnCoordinate)),
    % print(RowCoordinate),
    % print(ColumnCoordinate),
    XA is RowCoordinate-1,
    XB is RowCoordinate+1,
    YL is ColumnCoordinate-1,
    YR is ColumnCoordinate+1,
    find2D(Maze,AboveCoordinate,(XA,ColumnCoordinate)),
    find2D(Maze,BelowCoordinate,(XB,ColumnCoordinate)),
    find2D(Maze,LeftCoordinate,(RowCoordinate,YL)),
    find2D(Maze,RightCoordinate,(RowCoordinate,YR)),
    % print(AboveCoordinate),
    % print(BelowCoordinate),
    % print(LeftCoordinate),
    % print(RightCoordinate),
    (AboveCoordinate = 'x';BelowCoordinate = 'x';LeftCoordinate='x';RightCoordinate='x').
   

% find(List,What,Where)
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


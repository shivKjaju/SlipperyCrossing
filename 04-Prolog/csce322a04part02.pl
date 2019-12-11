%  change2d and fnd2D to player 1 and g coordinates && change2D to replace 1 with next coordinate and replace 1 with -+
fewestSlides(Maze,[u,u]):-
    find2D(Maze,'g',(Xg,Yg)),
    find2D(Maze,1,(Xone,Yone)),
    change2D(Maze,1,(Xg,Yg),MazeWithNoG),
    change2D(MazeWithNoG,'-',(Xone,Yone),FinalMaze),
    print(FinalMaze).

moveLeft(Maze,'l','x',Maze).
moveLeft(Maze,'l',2,Maze).
moveLeft(Maze,'l',3,Maze).
moveLeft(Maze,'l',4,Maze).
moveLeft(Maze,'l',111,NewMaze):-
    find2D(Maze,1,(X,Y)),
    Yleft is Y-1,
    find2D(Maze,Value,(X,Yleft)),
    moveLeft(Maze,'l',Value,NewMaze).

moveLeft(Maze,'l','-',NMaze):-
    find2D(Maze,1,(X,Y)), 
    Yleft is Y-1,
    change2D(Maze,1,(X,Yleft),NMazeL),
    change2D(NMazeL,'-',(X,Y),MazeLN),
    moveLeft(MazeLN,'l',111,NMaze).

moveLeft(Maze,'l','g',GMaze):-
    find2D(Maze,1,(X,Y)),
    Yleft is Y-1,
    change2D(Maze,1,(X,Yleft),NewMaze),
    change2D(NewMaze,'-',(X,Y),GMaze).

% Move the player right
moveRight(Maze,'r','x',Maze).
moveRight(Maze,'r',2,Maze).
moveRight(Maze,'r',3,Maze).
moveRight(Maze,'r',4,Maze).
moveRight(Maze,'r',111,NewMaze):-
    find2D(Maze,1,(X,Y)),
    Yleft is Y+1,
    find2D(Maze,Value,(X,Yleft)),
    moveRight(Maze,'r',Value,NewMaze).

moveRight(Maze,'r','-',NMaze):-
    find2D(Maze,1,(X,Y)), 
    Yleft is Y+1,
    change2D(Maze,1,(X,Yleft),NMazeL),
    change2D(NMazeL,'-',(X,Y),MazeLN),
    moveRight(MazeLN,'r',111,NMaze).

moveRight(Maze,'r','g',GMaze):-
    find2D(Maze,1,(X,Y)),
    Yleft is Y+1,
    change2D(Maze,1,(X,Yleft),NewMaze),
    change2D(NewMaze,'-',(X,Y),GMaze).

% Move the player up

moveUp(Maze,'u','x',Maze).
moveUp(Maze,'u',2,Maze).
moveUp(Maze,'u',3,Maze).
moveUp(Maze,'u',4,Maze).
moveUp(Maze,'u',111,NewMaze):-
    find2D(Maze,1,(X,Y)),
    Xup is X-1,
    find2D(Maze,Value,(Xup,Y)),
    moveUp(Maze,'u',Value,NewMaze).

moveUp(Maze,'u','-',NMaze):-
    find2D(Maze,1,(X,Y)), 
    Xup is X-1,
    change2D(Maze,1,(Xup,Y),NMazeL),
    change2D(NMazeL,'-',(X,Y),MazeLN),
    moveUp(MazeLN,'u',111,NMaze).

moveUp(Maze,'u','g',GMaze):-
    find2D(Maze,1,(X,Y)),
    Xup is X-1,
    change2D(Maze,1,(Xup,Y),NewMaze),
    change2D(NewMaze,'-',(X,Y),GMaze).

% Move the player down

moveDown(Maze,'d','x',Maze).
moveDown(Maze,'d',2,Maze).
moveDown(Maze,'d',3,Maze).
moveDown(Maze,'d',4,Maze).
moveDown(Maze,'d',111,NewMaze):-
    find2D(Maze,1,(X,Y)),
    Xd is X+1,
    find2D(Maze,Value,(Xd,Y)),
    moveDown(Maze,'d',Value,NewMaze).

moveDown(Maze,'d','-',NMaze):-
    find2D(Maze,1,(X,Y)), 
    Xd is X+1,
    change2D(Maze,1,(Xd,Y),NMazeL),
    change2D(NMazeL,'-',(X,Y),MazeLN),
    moveDown(MazeLN,'d',111,NMaze).

moveDown(Maze,'d','g',GMaze):-
    find2D(Maze,1,(X,Y)),
    Xd is X+1,
    change2D(Maze,1,(Xd,Y),NewMaze),
    change2D(NewMaze,'-',(X,Y),GMaze).

% BFS implementation
% bfs(From,To,Path)
bfs(From,From,[From]).
bfs(From,To,[From|Rest]):-    
    length(Rest,_),    
    edge(From,Next),    
    bfs(Next,To,Rest).

% set(Before,NewElement,Position,After)
set([_|T],NewElement,1,[NewElement|T]).
set([H|T],NewElement,P,[H|NewT]):-
    length([H|T],Len),
    between(1,Len,P),
    PM1 is P - 1,
    set(T,NewElement,PM1,NewT).
    
% change2D([Row|Rows],NewElement,(R,C),Result)
change2D([Row|Rows],NewElement,(1,C),[NewRow|Rows]):-    
    set(Row,NewElement,C,NewRow).
change2D([Row|Rows],NewElement,(R,C),[Row|Result]):-    
    length([Row|Rows],NumRows),    
    between(1,NumRows,R),    
    RNew is R - 1,    
    change2D(Rows,NewElement,(RNew,C),Result).

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

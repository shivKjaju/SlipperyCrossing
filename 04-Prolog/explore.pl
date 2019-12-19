% flatten2([],[]).
% flatten2([H|T], FinalList) :- 
%     flatten2(T, NewList),
%     append(H, NewList, FinalList).

% % find(List,What,Where)
% find([What|_],What,1).
% find([_|T],What,Where):-
%     find(T,What,WhereT),
%     Where is WhereT + 1.
    
% find2D(ListOfLists,What,Where)
% find2D([Row|Rows],What,(RowL,ColL))
% find2D([Row|_],What,(1,C)):-    
%     find(Row,What,C).
% find2D([_|Rows],What,(R,RowsC)):-    
%     find2D(Rows,What,(RowsR,RowsC)),    
%     R is RowsR + 1.

% filter function

% are_identical(X, Y) :-
%     X == Y.

% filterList(A, In, Out) :-
%     exclude(are_identical(A), In, Out).


% returnMember([H|_], X).
% returnMember([_|T], X):-
%     returnMember(T,X),
%     print(X).

% subtract a number from all list elements
% subtractList([],_,[]).
% subtractList([H|T], Element, Out):-
%     subtractList(T, Element, OutList),
%     NewValue is H - Element,
%     abs(NewValue, X),
%     append([X], OutList, Out).

% makeAbs([],[]).
% makeAbs([H|T], AbsolutedList):-
%     makeAbs(T, NewAbsolutedList),

% shrinkList([],[]).
% shrinkList([H|T], ShrinkedList):-
%     append(PlayersList, T, ShrinkedList).

% square the list values
% squareMaker([],[]).
% squareMaker([H|T],SquaredList):-
%     squareMaker(T,NewSquaredList),
%     NewValue is H^2,
%     append([NewValue],NewSquaredList,SquaredList).
    


mystery(0,1).
mystery(A,B):− 
    0 is mod(A,2), 
    C is A/2, 
    mystery(C,D),B is D∗∗2,!. 

mystery(E,F) :− 
    1 is mod(E,2), 
    G is E−1, 
    mystery(G,H),F is H∗2,!.


















































% noAdvantage(Maze):-
%     % find num of players
%     flatten2D(Maze,NewList),
%     find(NewList,'g', Gcoordinate),
%     filterList('x', NewList, ListWithoutX),
%     filterList('-', ListWithoutX, ListWithoutPath),
%     filterList('g', ListWithoutPath, ListWithOutGoal),
%     sort(ListWithOutGoal, SortedList),
%     returnMember(SortedList, NewList, PlayerPosition),
%     subtractList(PlayerPosition, Gcoordinate, GoalDistance),
%     print(Gcoordinate),
%     nl,
%     print(SortedList),
%     nl,
%     print(PlayerPosition),
%     nl,
%     print(GoalDistance),
%     nl,
%     find(GoalDistance, MinValue,1),
%     print(MinValue),
%     nl,
%     include(>=(MinValue),GoalDistance,LessThanPlayerOneList),
%     print(LessThanPlayerOneList),
%     nl,
%     length(LessThanPlayerOneList, LengthOfTheList),
%     print(LengthOfTheList),
%     LengthOfTheList = 1 -> false.
% % find minValue
% % getPlayerOneDistance([H|T], PlayerOneDistance):-
% % PlayerOneDistance is H.


% % subtract g coor from player coor
% subtractList([],_,[]).
% subtractList([H|T], Element, Out):-
%     subtractList(T, Element, OutList),
%     NewValue is H - Element,
%     abs(NewValue, X),
%     append([X], OutList, Out).

% % return memebers in list
% returnMember([],_,[]).
% returnMember([H|T], CompleteList, PlayerCoor):- 
%     returnMember(T, CompleteList, CurrList),
%     find(CompleteList, H, Coor),
%     append([Coor], CurrList, PlayerCoor).

% % extract list of players from flatten2D
% compare(X, Y) :-
%     X == Y.

% filterList(A, In, Out) :-
%     exclude(compare(A), In, Out).

% % flatten the 2d maze
% flatten2D([],[]).
% flatten2D([H|T], FinalList) :- 
%     flatten2D(T, NewList),
%     append(H, NewList, FinalList).

% % find coordinates
% find([What|_],What,1).
% find([_|T],What,Where):-
%     find(T,What,WhereT),
%     Where is WhereT + 1.


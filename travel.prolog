:-['test-database.prolog'].
travel(X, Y, Time_start, Time_end, Time_taken, [bus(X, Y, Number, Time_start, End)]):- 
	byBus(X, Y, Number, Start, End), 
	(>(Start, Time_start); =(Start, Time_start)),
	(<(End, Time_end); =(End, Time_end)),
	Time_taken is (End-Time_start).


travel(X, Y, Time_start, Time_end, Time_taken, [bus(X, Z, Number, Time_start, End) | W]):- byBus(X, Z, Number, Start, End),
	(>(Start, Time_start); =(Start, Time_start)),
	(<(End, Time_end); =(End, Time_end)),
	travel(Z, Y, End, Time_end, _, W),
	Time_taken is (Time_end-End)+(Start-End).

shorten([bus(RX1, RX2, N, RX3, RX4), bus(RY1, RY2, N, RY3, RY4) | W], [bus(RX1, RY2, N, RX3, RY4) | List]):- 
	shorten(W, List).

shorten([bus(RX1, RX2, N1, RX3, RX4), bus(RY1, RY2, N2, RY3, RY4) | W], [bus(RX1, RX2, N1, RX3, RX4), bus(RY1, RY2, N2, RY3, RY4) | List]):-
	shorten(W, List).

shorten([], []).

trav(X, Y, Time_start, Time_end, Time_taken, W):- travel(X, Y, Time_start, Time_end, Time_taken, W1), shorten(W1, W).


:-['database'].
travel(X, Y, Time_start, Time_end, Time_taken, [go(bus(X, Y, Number, Time_start, End))]):- 
	byBus(X, Y, Number, Start, End), 
	(>(Start, Time_start); =(Start, Time_start)),
	(<(End, Time_end); =(End, Time_end)),
	Time_taken is (End-Time_start).


travel(X, Y, Time_start, Time_end, Time_taken, [go(bus(X, Z, Number, Time_start, End)) | W]):- byBus(X, Z, Number, Start, End),
	(>(Start, Time_start); =(Start, Time_start)),
	(<(End, Time_end); =(End, Time_end)),
	travel(Z, Y, End, Time_end, _, W),
	Time_taken is (Time_end-End)+(Start-End).

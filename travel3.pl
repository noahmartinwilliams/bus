travel(X, Y, Time_start, Time_end, Time_taken, go(car(X, Y, Time_start, End))):- 
	byCar(X, Y, Time_start, End), 
	(<(End, Time_end); =(End, Time_end)),
	Time_taken is (End-Time_start).

travel(X, Y, Time_start, Time_end, Time_taken, go(train(X, Y, Number, Time_start, End))):- 
	byTrain(X, Y, Number, Time_start, End), 
	(<(End, Time_end); =(End, Time_end)),
	Time_taken is (End-Time_start).

travel(X, Y, Time_start, Time_end, Time_taken, go(plane(X, Y, Number, Time_start, End))):- 
	byPlane(X, Y, Number, Time_start, End), 
	(<(End, Time_end); =(End, Time_end)),
	Time_taken is (End-Time_start).

travel(X, Y, Time_start, Time_end, Time_taken, go(bus(X, Y, Number, Time_start, End))):- 
	byBus(X, Y, Number, Time_start, End), 
	(<(End, Time_end); =(End, Time_end)),
	Time_taken is (End-Time_start).

travel(X, Y, Time_start, Time_end, Time_taken, [go(plane(X, Z, Number, Time_start, End))| W]):- byPlane(X, Z, Number, Start, End), 
	(>(Start, Time_start); =(Start, Time_start)),
	(<(End, Time_end); =(End, Time_end)),
	travel(Z, Y, End, Time_end, T, W), 
	Time_taken is T + (Start-End)+(Time_end-End).

travel(X, Y, Time_start, Time_end, Time_taken, [go(train(X, Z, Number, Time_start, End)) | W]):- byTrain(X, Z, Number, Start, End), 
	(>(Start, Time_start); =(Start, Time_start)),
	(<(End, Time_end); =(End, Time_end)),
	travel(Z, Y, End, Time_end, T, W),
	Time_taken is (Time_end-End)+(Start-End).

travel(X, Y, Time_start, Time_end, Time_taken, [go(car(X, Z, Time_start, End)) | W]):- byCar(X, Z, Start, End),
	(>(Start, Time_start); =(Start, Time_start)),
	(<(End, Time_end); =(End, Time_end)),
	travel(Z, Y, End, Time_end, T, W),
	Time_taken is (Time_end-End)+(Start-End).

travel(X, Y, Time_start, Time_end, Time_taken, [go(bus(X, Z, Number, Time_start, End)) | W]):- byBus(X, Z, Number, Start, End),
	(>(Start, Time_start); =(Start, Time_start)),
	(<(End, Time_end); =(End, Time_end)),
	travel(Z, Y, End, Time_end, T, W),
	Time_taken is (Time_end-End)+(Start-End).

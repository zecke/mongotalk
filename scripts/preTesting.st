"Switch TaskIt into the test mode... does it help for debugging?"
TKTProfile test.

"Fix a race where a task could stop without calling the stop handlers."
TKTService compile: 'stop
	| futureStop |
	futureStop := TKTFuture new.
	self onStoppedDo: [ :v | futureStop deploySuccess: self ].
	stopRequested := true.
	TKTConfiguration serviceManager removeService: self.
	^ futureStop'

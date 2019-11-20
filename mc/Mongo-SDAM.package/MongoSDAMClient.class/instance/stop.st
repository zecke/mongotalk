API
stop
	| future |
	future := TKTFuture of: 1. 
	monitors valuesDo: [ :each | 
		each isRunning ifTrue: [ 
			future := future zip: each stop ] ].
	monitors := Dictionary new.
	future waitForCompletion: 40 seconds.

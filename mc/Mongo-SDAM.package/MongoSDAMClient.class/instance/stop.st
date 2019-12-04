API
stop

	monitors valuesDo: [ :each | 
		each isRunning ifTrue: [ 
			each stop waitForCompletion: 40 seconds ] ].
	monitors := Dictionary new.

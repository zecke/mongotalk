private - server selection
detectMonitorFor: aReadPreference localThreshold: localThresholdDuration
	"Detect a monitor for the received arguments, signalling MongoSDAMServerSelectionTimeout if none is found.

	This behavior is defined by the mongodb's Server Selection specification.

	Sources: 
	* https://docs.mongodb.com/manual/core/read-preference-mechanics/
	* https://www.mongodb.com/blog/post/server-selection-next-generation-mongodb-drivers
	* https://github.com/mongodb/specifications/blob/master/source/max-staleness/max-staleness.rst#maxstalenessseconds-is-part-of-read-preferences
	"
	
	| startMS serverSelectionTimeoutMS |
	startMS := Time millisecondClockValue.
	serverSelectionTimeoutMS := self serverSelectionTimeout asMilliSeconds.
	[	self
			detectMonitorFor: aReadPreference
			localThreshold: localThresholdDuration
			ifFound: [ :found | ^ found ]
			ifNone: [ self minHeartbeatFrequency wait ].
	] doWhileTrue: [ (Time millisecondsSince: startMS) < serverSelectionTimeoutMS ].

	^ MongoSDAMServerSelectionTimeout signal
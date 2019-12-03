operations
commandFind: filterDictionary limit: aLimit collection: collectionName readConcern: aConcern

	| dict |
	dict := {
		'find' -> collectionName.
		'filter' -> filterDictionary.
		'limit' -> aLimit.
		} as: OrderedDictionary.
		
	filterDictionary ifNil: [ 
		dict removeKey: 'filter'].

	aConcern ifNotNil: [
		dict at: 'readConcern' put: aConcern concernForCommand ].

	^ MongoCommandCursor database: self dictionary: dict
private-operations
commandInsert: newDictionary writeConcern: aConcern
	"Update using Mongo command. Answer the output of the command.
	See more on https://docs.mongodb.com/manual/reference/command/insert/"

	^database commandInsert: newDictionary collection: name writeConcern: aConcern
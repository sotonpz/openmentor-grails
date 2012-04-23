package uk.org.openmentor.data

class Comment {
	
	String text
	
	static belongsTo = [ submission: Submission ]

	static hasMany = [ classes: String ]

	static mappings = {
		text sqlType:'longtext'	
	}
    static constraints = {
		text(nullable: false)
    }
}

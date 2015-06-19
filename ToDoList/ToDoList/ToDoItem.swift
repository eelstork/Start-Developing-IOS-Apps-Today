
import Foundation

class ToDoItem {
	
	var itemName:String?
	var completed:Bool = false
	var creationDate:NSDate = NSDate.init()
	
	init(name:String){
	
		itemName=name
		
	}
	
}

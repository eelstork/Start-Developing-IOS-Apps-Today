
import UIKit

class AddToDoItemViewController: UIViewController{

	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var saveButton: UIBarButtonItem!

	var toDoItem:ToDoItem?

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
	
		if ((sender as UIBarButtonItem) != saveButton){
			return
		}
		let str=textField.text
		if (str.utf16Count > 0) {
			toDoItem = ToDoItem(name: str)
		}
	}

}

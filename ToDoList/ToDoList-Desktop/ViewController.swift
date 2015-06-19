
import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate  {

	@IBOutlet weak var newTaskNameField: NSTextField!
	@IBOutlet weak var tableView: NSTableView!
	
	var todoItems:[ToDoItem]=[]
	
	@IBAction func AddToDoItem(sender: AnyObject) {
		
		let str=newTaskNameField.stringValue
		if (str.utf16Count > 0) {
			todoItems.append( ToDoItem(name: str) )
		}
		newTaskNameField.stringValue = ""
		tableView.reloadData()
		
	}
	
	override func viewDidLoad() {
		
		todoItems = CreateSampleToDoList()
		
	}
	
	// <DataSource>
	
	func numberOfRowsInTableView(tableView: NSTableView) -> Int {
		
		return todoItems.count;
		
	}
	
	// <TableViewDelegate>
	
	func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
		
		if(tableColumn?.identifier == "Name"){
			var cellView: AnyObject? = tableView.makeViewWithIdentifier("NameCellPrototype", owner: self)
			let cell=cellView as NSTableCellView
			cell.textField?.stringValue = todoItems[row].itemName!
			return cell;
		}
		
		if(tableColumn?.identifier == "Status"){
			var cellView: AnyObject? = tableView.makeViewWithIdentifier("StatusCellPrototype", owner: self)
			let cell=cellView as NSTableCellView
			cell.textField?.stringValue = todoItems[row].completed ? "Done" : "-"
			return cell;
		}
		
		return nil;
		
	}
	
	func tableViewSelectionDidChange(notification: NSNotification) {
		
		let view:NSTableView = notification.object as NSTableView
		let row = view.selectedRow
		todoItems[row].completed = !todoItems[row].completed
		
		// Causes table to refresh and selection status cleared
		// without (undesirable) notifications.
		view.reloadData()
		
	}
	
}



import UIKit

class TodoListTableViewController:UITableViewController{

	var todoItems:[ToDoItem]=[]

	@IBAction func unwindToList(segue:UIStoryboardSegue) {

		let source = segue.sourceViewController as AddToDoItemViewController
		var item = source.toDoItem
		if(item != nil){
			todoItems.append(item!)
			tableView.reloadData()
		}

	}

	override func viewDidLoad() {

		super.viewDidLoad()
		todoItems = CreateSampleToDoList();

	}

	override func didReceiveMemoryWarning() {

		super.didReceiveMemoryWarning()

	}

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

		return 1

	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return todoItems.count

	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{

		let cell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell", forIndexPath: indexPath) as UITableViewCell

		let toDoItem = todoItems[indexPath.row]
		cell.textLabel?.text = toDoItem.itemName
		if(toDoItem.completed){
			cell.accessoryType = UITableViewCellAccessoryType.Checkmark
		}else{
			cell.accessoryType = UITableViewCellAccessoryType.None
		}
		return cell

	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

		tableView.deselectRowAtIndexPath(indexPath, animated: false)
		var tappedItem = todoItems[indexPath.row]
		tappedItem.completed = !tappedItem.completed
		tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)

	}

}

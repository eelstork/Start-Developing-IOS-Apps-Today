
func CreateSampleToDoList() -> [ToDoItem]{
	
	var list:[ToDoItem]=[]
	
	let item1 = ToDoItem(name: "Buy milk" )
	let item2 = ToDoItem(name: "Buy eggs" )
	let item3 = ToDoItem(name: "Read a book" )
	
	list.append(item1)
	list.append(item2)
	list.append(item3)
	
	return list;
	
}

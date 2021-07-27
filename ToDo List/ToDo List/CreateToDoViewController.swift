//
//  CreateToDoViewController.swift
//  ToDo List
//

//

import UIKit

class CreateToDoViewController: UIViewController {
    
    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var nameTextField: UITextField!
    var toDoTableVC : ToDoTableViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addTapped(_ sender: Any) {
        let newToDo = ToDo()
        if let name =  nameTextField.text {
            newToDo.name = name
            newToDo.important = importantSwitch.isOn
            toDoTableVC?.toDos.append(newToDo)
            toDoTableVC?.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
    }
    
}

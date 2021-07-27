//
//  ToDoTableViewController.swift
//  ToDo List
//
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toDo1 = ToDo()
        toDo1.name = "Buy Milk"
        toDo1.important = true
        
        let toDo2 = ToDo()
        toDo2.name = "Walk the Dog"
        toDo2.important = false
        
        toDos = [toDo1,toDo2]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
        } else {
            cell.textLabel?.text = toDo.name
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = toDos[indexPath.row]
        performSegue(withIdentifier: "goToComplete", sender: selectedToDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as? CreateToDoViewController {
            createVC.toDoTableVC = self
        }
        
        if let completeVC = segue.destination as? CompleteViewController {
            if let toDo = sender as? ToDo {
                completeVC.toDo = toDo
                completeVC.toDoTableVC = self
            }
        }
    }
    
}

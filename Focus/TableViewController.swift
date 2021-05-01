//
//  TableViewController.swift
//  Focus
//
//  Created by Nour Altunaib on 5/1/21.
//

import UIKit
var tasks = [String]()
var times = [String]()
class TableViewController: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
        tableView.delegate = self
        tableView.dataSource = self
        // Setup
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
            
        }

        // Get all current saved tasks
         updateTasks()
       
    }
    func updateTasks(){
        
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
       
        for x in 0..<count{
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String  {
                tasks.append(task)
                
            }
            
            
        }
        tableView.reloadData()
    }
    @IBAction func addBtn() {
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count 
               
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.textLabel?.text = tasks[indexPath.row]
        //cell.cellLable?.text = times[indexPath.row]
        return cell
    }
    

   

}

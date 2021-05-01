//
//  EntryViewController.swift
//  Focus
//
//  Created by Nour Altunaib on 5/1/21.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var bg: UILabel!
    @IBOutlet weak var field: UITextField!
    var update: (() -> Void)?
    //var cell = TableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        field.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .done, target: self, action: #selector(saveTask))
        bg.layer.borderWidth = 2
        bg.layer.cornerRadius = 10
        bg.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 0.9016166329, alpha: 1)
    }
    

    @objc func saveTask() {
     guard let text = field.text, !text.isEmpty
     else {
         return
     }
    guard let count = UserDefaults().value(forKey: "count") as? Int
    else{return}
    /*guard let timer = UserDefaults().value(forKey: "time") as? Int
        else{return}*/
     let newCount = count + 1
     UserDefaults().set(newCount, forKey: "count")
     UserDefaults().set(text, forKey: "task_\(newCount)")
     update?()
     navigationController?.popViewController(animated: true)
     }

}

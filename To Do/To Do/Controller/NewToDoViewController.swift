//
//  NewToDoViewController.swift
//  To Do
//
//  Created by Miriam Hendler on 11/18/16.
//  Copyright © 2016 Miriam Hendler. All rights reserved.
//

import UIKit

class NewToDoViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    var newToDo: ((ToDo) -> ())?
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if titleTextField.text != "" {
        var toDo = ToDo(title: titleTextField.text!, date: datePicker.date, didCompleteTask: false)
            newToDo!(toDo)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

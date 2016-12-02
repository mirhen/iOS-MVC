//
//  ToDoTableViewCell.swift
//  To Do
//
//  Created by Miriam Hendler on 11/18/16.
//  Copyright © 2016 Miriam Hendler. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    var currentToDo: ToDo? {
        didSet {
            setupCellUI()
        }
    }
    
    var tableViewController: ToDoListTableViewController? = nil

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var completedTaskButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func completedTaskButtonPressed(_ sender: Any) {
        tableViewController?.updateTask(forToDo: currentToDo!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCellUI() {
        if let toDo = currentToDo {
            nameLabel.text = toDo.title
            
            switch toDo.didCompleteTask {
            case true:
                descriptionLabel.text = "You are done here 💪"
                completedTaskButton.setTitle("✅", for: .normal)
                descriptionLabel.textColor = .green
            default:
                descriptionLabel.text = "Deadline: \(toDo.date.description)"
                descriptionLabel.textColor = .red
                completedTaskButton.setTitle("❌", for: .normal)
            }
        }
    }

}

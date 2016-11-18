//
//  AddFriendViewController.swift
//  MoodTracker-starter
//
//  Created by Miriam Hendler on 11/16/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {
    
    
    @IBOutlet weak var moodSegmentedControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    
    var currentFriend: Friend?
    var newFriend: ((Friend) -> ())? = nil
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if let text = nameTextField.text {
            let mood = moodSegmentedControl.titleForSegment(at: moodSegmentedControl.selectedSegmentIndex)
            if currentFriend != nil {
            } else {
                let friend = Friend(name: text, mood: Mood(rawValue: mood!)!)
                newFriend!(friend)
            }
        }
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let friend = currentFriend {
            nameTextField.text = friend.name
            moodSegmentedControl.selectedSegmentIndex = friend.mood.hashValue
        }
    }
    // Do any additional setup after loading the view.
    
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FriendsTableViewController {
            if segue.identifier == "save" {
                if currentFriend != nil {
                    if let text = nameTextField.text {
                        let mood = moodSegmentedControl.titleForSegment(at: moodSegmentedControl.selectedSegmentIndex)
                        for friend in destination.friendArray {
                            if friend === currentFriend {
                                friend.name = text
                                friend.mood = Mood(rawValue: mood!)!
                            }
                            destination.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
}

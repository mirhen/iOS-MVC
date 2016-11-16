//
//  FriendsTableViewController.swift
//  MoodTracker-starter
//
//  Created by Nikolas Burk on 02/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    //Setting up friends
    var friendArray: [Friend] = [
        Friend(name: "Joe", mood: .happy),
        Friend(name: "Jack", mood: .mad),
        Friend(name: "Jane", mood: .medium),
        Friend(name: "Jill", mood: .happy),
        Friend(name: "Jose", mood: .medium),
        ]
    
    
    //MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: Table View Delegate Functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell") as! FriendTableViewCell
        let friend = friendArray[indexPath.row]
        
        cell.currentFriend = friend
        cell.tableViewController = self
        print(#function, friend.mood)
        //        cell.nameLabel.text = friend.name
        //        cell.moodButton.setTitle(friend.mood.rawValue, for: .normal)
        //        switch friend.mood {
        //        case .happy:
        //            cell.moodDescriptLabel.text = "todays a great day :)"
        //        case .medium:
        //            cell.moodDescriptLabel.text = "when can I go home?"
        //        case .mad:
        //            cell.moodDescriptLabel.text = "LEAVE ME ALONE"
        //        }
        return cell
    }
    
    
    //MARK: Helpers
    
    func updateFriendsMood(friend: Friend, newMood: Mood) {
        print(#function, friend.mood)
        //this reffers to the right friend object bc were not making a new instance were actually using the same object throughout this whole time
        friend.mood = newMood
        print(#function, friend.mood)
        tableView.reloadData()
        
        //        for currentFriend in friendArray {
        //            if currentFriend === friend {
        //                currentFriend.mood = newMood
        //            }
        //        }
    }
}

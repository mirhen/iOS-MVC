//
//  FriendsTableViewController.swift
//  MoodTracker-starter
//
//  Created by Nikolas Burk on 02/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
  
    var friendArray: [Friend] = [
    Friend(name: "Joe", mood: .happy),
    Friend(name: "Jack", mood: .mad),
    Friend(name: "Jane", mood: .medium),
    Friend(name: "Jill", mood: .happy),
    Friend(name: "Jose", mood: .medium),
    ]
    
  override func viewDidLoad() {
    super.viewDidLoad()
  }
    
    func setUIForCurrentMoodState(forFriend: Friend, newFriendMood: Mood) {

        forFriend.mood = newFriendMood
        tableView.reloadData()
        
    }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return friendArray.count
  }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell") as! FriendTableViewCell
        
        let friend = friendArray[indexPath.row]
        
        cell.nameLabel.text = friend.name
        cell.currentFriend = friend
        cell.tableViewController = self
        
        switch friend.mood {
        case .happy:
            
            cell.moodDescriptLabel.text = "todays a great day :)"
        case .medium:
            
            cell.moodDescriptLabel.text = "when can I go home?"
        case .mad:
            
            cell.moodDescriptLabel.text = "LEAVE ME ALONE"
        }
        cell.moodButton.setTitle(friend.mood.rawValue, for: .normal)
        return cell
    }
}

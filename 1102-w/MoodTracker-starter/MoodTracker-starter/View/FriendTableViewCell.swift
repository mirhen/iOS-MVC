//
//  FriendTableViewCell.swift
//  MoodTracker-starter
//
//  Created by Nikolas Burk on 02/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    var currentFriend: Friend? 
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moodDescriptLabel: UILabel!
    @IBOutlet weak var moodButton: UIButton!
    
    var tableViewController: FriendsTableViewController? = nil

    @IBAction func moodButtonPressed(_ sender: AnyObject) {
        
        tableViewController?.setUIForCurrentMoodState(forFriend: currentFriend!, newFriendMood: updateMood())
    }
    
    private func updateMood() -> Mood {
        var mood: Mood = currentFriend!.mood
        
        if let friend = currentFriend {
            switch friend.mood {
            case .happy:
                mood = .medium
            case .medium:
                mood = .mad
            case .mad:
                mood = .happy
            }
        }
       return mood
    }
}
    



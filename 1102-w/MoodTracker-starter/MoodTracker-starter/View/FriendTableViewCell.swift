//
//  FriendTableViewCell.swift
//  MoodTracker-starter
//
//  Created by Nikolas Burk on 02/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    //Setup IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moodDescriptLabel: UILabel!
    @IBOutlet weak var moodButton: UIButton!
    
    //Other Variables
    var currentFriend: Friend? {
        didSet {
            updateUI()
        }
    }
    var tableViewController: FriendsTableViewController? = nil
    
    
    //MARK: Actions
    
    @IBAction func moodButtonPressed(_ sender: AnyObject) {
        
        if let controller = tableViewController {
            if let friend = currentFriend {
                print(#function, friend.mood)
                controller.updateFriendsMood(friend: friend, newMood: updateMood())
            }
        }
    }
    
    
    // MARK: Helpers
    
    private func updateMood() -> Mood {
        var mood: Mood = .happy
        
        if let friend = currentFriend {
            mood = friend.mood
            print(#function, friend.mood)
            
            switch friend.mood {
            case .happy:
                mood = .medium
            case .medium:
                mood = .mad
            case .mad:
                mood = .happy
            }
            print(#function, friend.mood)
        }
        return mood
    }
    
    private func updateUI() {
        if let friend = currentFriend {
            nameLabel.text = friend.name
            moodButton.setTitle(friend.mood.rawValue, for: .normal)
            switch friend.mood {
            case .happy:
                moodDescriptLabel.text = "todays a great day :)"
            case .medium:
                moodDescriptLabel.text = "when can I go home?"
            case .mad:
                moodDescriptLabel.text = "LEAVE ME ALONE"
            }
        }
    }
}




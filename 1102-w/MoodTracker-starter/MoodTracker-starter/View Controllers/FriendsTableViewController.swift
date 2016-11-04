//
//  FriendsTableViewController.swift
//  MoodTracker-starter
//
//  Created by Nikolas Burk on 02/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
  
  static let happyString = "Oh happy day..."
  static let badString = "Get off my lawn!!!"
  static let mediumString = "Well, I don't really care."
  
  var friendArray = [
    Friend(name: "John", mood: .happy),
    Friend(name: "Jack", mood: .happy),
    Friend(name: "Sarah", mood: .happy),
    Friend(name: "Jenny", mood: .happy)
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return friendArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    print(indexPath.row)
    let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell") as! FriendTableViewCell
    
    let friend = friendArray[indexPath.row]
    cell.nameLabel.text = friend.name
    
//    switch friend.mood {
//    case .angry:
//      cell.moodDescriptionLabel.text = FriendsTableViewController.badString
//    case .medium:
//      cell.moodDescriptionLabel.text = FriendsTableViewController.mediumString
//    case .happy:
//      cell.moodDescriptionLabel.text = FriendsTableViewController.happyString
//    }
//    cell.moodButton.titleLabel?.text = friend.mood.rawValue
    cell.moodButton.setTitle(friend.mood.rawValue, for: .normal)
    
    
    return cell
  }
}

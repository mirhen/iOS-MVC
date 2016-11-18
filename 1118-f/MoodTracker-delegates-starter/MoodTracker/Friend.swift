//
//  Friend.swift
//  MoodTracker
//
//  Created by Nikolas Burk on 01/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import Foundation

enum Mood: String {
  case angry = "😡"
  case medium = "😑"
  case happy = "😁"
}

class Friend {
  
  init(name: String, mood: Mood = .happy) {
    self.name = name
    self.mood = mood
  }
  
  let name: String
  var mood: Mood
}

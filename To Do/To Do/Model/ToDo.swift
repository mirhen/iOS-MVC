//
//  ToDo.swift
//  To Do
//
//  Created by Miriam Hendler on 11/18/16.
//  Copyright © 2016 Miriam Hendler. All rights reserved.
//

import Foundation

class ToDo {
    let title: String
    var didCompleteTask: Bool
    let date: Date
    
    init(title: String, date: Date, didCompleteTask: Bool) {
        self.title = title
        self.date = date
        self.didCompleteTask = didCompleteTask
    }
}

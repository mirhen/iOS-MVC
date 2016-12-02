//
//  Calculator.swift
//  Calculator
//
//  Created by Miriam Hendler on 11/21/16.
//  Copyright © 2016 Miriam Hendler. All rights reserved.
//

import Foundation

enum Operator: String {
    case add = "+"
    case subtract = "-"
}

class Calculate {
    var firstValue: Int
    var secondValue: Int
    var operate: Operator?
    var result: Int?
    
    init(firstValue: Int, secondValue: Int) {
        self.firstValue = firstValue
        self.secondValue = secondValue
    }
    
    func add() -> Int {
        return firstValue + secondValue
    }
    
    func subtract() -> Int {
        return firstValue - secondValue
    }
    
}


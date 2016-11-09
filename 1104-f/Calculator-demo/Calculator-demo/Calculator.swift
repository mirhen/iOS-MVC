//
//  Calculator.swift
//  Calculator-demo
//
//  Created by Nikolas Burk on 09/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import Foundation


class Calculator {
  
  enum Operation: Int { // rawValues of type Int so it goes nicely with the segmented control
    case addition
    case subtraction
  }
  
  let capabilities = ["Addition", "Subtraction"]
  let signs = ["+", "-"]
  
  func name(for operation: Operation) -> String {
    return capabilities[operation.rawValue]
  }
  
  func sign(for operation: Operation) -> String {
    return signs[operation.rawValue]
  }
  
  func printSupportedOperations() {
    print("I can do the following:")
    for capability in capabilities {
      print(capability)
    }
  }
  
  func add(a: Int, b: Int) -> Int {
    return a+b
  }
  
  func subtract(a: Int, b: Int) -> Int {
    return a-b
  }
  
}


//
//  ViewController.swift
//  Calculator-demo
//
//  Created by Nikolas Burk on 04/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
  
  let calculator = Calculator()
  
  @IBOutlet weak var operationSegmentedControl: UISegmentedControl!
  @IBOutlet weak var firstTextField: UITextField!
  @IBOutlet weak var secondTextField: UITextField!
  @IBOutlet weak var operationLabel: UILabel!
  @IBOutlet weak var resultLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // view controller send a message to the calculator requesting it to print
    // the mathematical operations it supports
    calculator.printSupportedOperations()
  }

  @IBAction func operationChanged(_ sender: UISegmentedControl) {
    if let operation = Calculator.Operation(rawValue: sender.selectedSegmentIndex) {
      operationLabel.text = calculator.sign(for: operation)
    }
    else {
      print("no operation for idnex: \(sender.selectedSegmentIndex)")
    }
  }

  @IBAction func calculateButtonPressed(_ sender: AnyObject) {
    guard let a =  Int(firstTextField.text!) else {
      print("\(firstTextField.text!) is not a number")
      return
    }
    guard let b =  Int(secondTextField.text!) else {
      print("\(secondTextField!) is not a number")
      return
    }
    let result: Int
    switch operationSegmentedControl.selectedSegmentIndex {
    case Calculator.Operation.addition.rawValue:
      // view controller send a message to the calculator requesting it to add a and b
      // a and b are the "payload" of the message
      result = calculator.add(a: a, b: b)
    case Calculator.Operation.subtraction.rawValue:
      // view controller send a message to the calculator requesting it to subtract b from a
      // a and b are the "payload" of the message
      result = calculator.subtract(a: a, b: b)
    default:
      result = 0
    }
    print(result)
    resultLabel.text = "\(result)"
  }

}


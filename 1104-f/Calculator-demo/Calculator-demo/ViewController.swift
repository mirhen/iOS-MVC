//
//  ViewController.swift
//  Calculator-demo
//
//  Created by Nikolas Burk on 04/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

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

  func printCapabilities() {
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

class ViewController: UIViewController {
  
  let calculator = Calculator()
  
  @IBOutlet weak var operationSegmentedControl: UISegmentedControl!
  @IBOutlet weak var firstTextField: UITextField!
  @IBOutlet weak var secondTextField: UITextField!
  @IBOutlet weak var operationLabel: UILabel!
  @IBOutlet weak var resultLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
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
      result = a+b
    case Calculator.Operation.subtraction.rawValue:
      result = a-b
    default:
      result = 0
    }
    print(result)
    resultLabel.text = "\(result)"
    resultLabel.sizeToFit()
  }

}


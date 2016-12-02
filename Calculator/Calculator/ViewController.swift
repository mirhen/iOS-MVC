//
//  ViewController.swift
//  Calculator
//
//  Created by Miriam Hendler on 11/21/16.
//  Copyright © 2016 Miriam Hendler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstValue: Int = 0
    var secondValue: Int = 0
    var result: Int?
    var operate: Operator?
    var computedResult: Int = 0
    var calculator: Calculate?
    var computedResults: [Calculate] = []
    @IBOutlet weak var calculationLabel: UILabel!
    @IBOutlet weak var computedResultsLabel: UILabel!
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        firstValue = 0
        secondValue = 0
        result = 0
        calculationLabel.text = ""
        
    }
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        
        let operater = sender.titleLabel!.text!
        
        switch operater {
        case "+":
            self.operate = .add
        case "-":
            self.operate = .subtract
        default:
            break
        }
        createValue(value: &firstValue)
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        computedResult += 1
        computedResultsLabel.text = "Computed results: \(computedResult)"
        
        createValue(value: &secondValue)
        
         calculator = Calculate(firstValue: firstValue, secondValue: secondValue)
        
        switch operate! {
        case .add:
            result = calculator!.add()
            calculationLabel.text = "\(result!)"
            calculator!.operate = .add
        case .subtract:
            result = calculator!.subtract()
            calculationLabel.text = "\(result!)"
            calculator!.operate = .subtract
        }
        print("result \(result!)")
        calculator!.result = result!
        computedResults.append(calculator!)
        
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        calculationLabel!.text! += sender.titleLabel!.text!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createValue(value: inout Int) {
        if calculationLabel.text == "" {
            calculationLabel.text = "0"
        }
        value = Int(calculationLabel!.text!)!
        print("secondValue \(value)")
        calculationLabel.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ResultsTableViewController {
            if segue.identifier == "resultsSegue" {
                destination.computedResults = computedResults
                destination.tableView.reloadData()
                }
            }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


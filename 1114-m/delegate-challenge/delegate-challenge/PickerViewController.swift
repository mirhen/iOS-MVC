//
//  PickerViewController.swift
//  delegate-challenge
//
//  Created by Nikolas Burk on 07/10/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController {
  
  @IBOutlet weak var pickerView: UIPickerView!
  @IBOutlet weak var cityLabel: UILabel!
  
  let cities = ["New York", "San Francisco", "Berlin", "Hamburg", "Paris"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}

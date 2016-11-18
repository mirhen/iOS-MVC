//
//  TextFieldViewController.swift
//  delegate-challenge
//
//  Created by Nikolas Burk on 07/10/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class TextFieldViewController: UIViewController {
  
  @IBOutlet weak var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textField.autocapitalizationType = .allCharacters
  }
  
  
}

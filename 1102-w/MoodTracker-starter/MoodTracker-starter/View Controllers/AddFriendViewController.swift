//
//  AddFriendViewController.swift
//  MoodTracker-starter
//
//  Created by Nikolas Burk on 09/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {
  
  // MARK: View Controller Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  
  // MARK: Actions
  
  @IBAction func saveButtonPressed(_ sender: AnyObject) {
    // TODO: save the added friend here
    dismissViewController()
  }
  
  @IBAction func cancelButtonPressed(_ sender: AnyObject) {
    dismissViewController()
  }
  
  
  // MARK: Helpers
  
  func dismissViewController() {
    presentingViewController?.dismiss(animated: true)
  }
  
}

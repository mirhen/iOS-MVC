//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Miriam Hendler on 12/11/16.
//  Copyright © 2016 Miriam Hendler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let boardView = BoardView(boardWidth: 300, boardHeight: 300)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(boardView)
        boardView.center = self.view.center
    }
    
}


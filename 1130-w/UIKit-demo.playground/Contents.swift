//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let greenView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
greenView.backgroundColor = .green

PlaygroundPage.current.liveView = greenView

let redView = UIView(frame: CGRect(x: 50, y: 50, width: 150, height: 100))
redView.backgroundColor = .red

greenView.addSubview(redView)

greenView.center
redView.center

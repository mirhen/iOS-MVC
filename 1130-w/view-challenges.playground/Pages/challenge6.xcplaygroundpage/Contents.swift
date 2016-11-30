import UIKit
import PlaygroundSupport

let canvasFrame = CGRect(x: 0, y :0, width: 400, height: 200)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor


/*:
 **Task**: Add two `UIView`s to the `canvas`. The positioning and size of the two views have the following requirements:
 
 - the **blue** view should have a _margin_ of 20 points each to the _top_ and to the _leading_ (left) edge; it should further be square and have half the `height` as the `canvas`
 - the **green** view should have a _margin_ of 20 points each to the _bottom_ and to the _trailing_ (right) edge; it should further be square and have half the `height` as the `canvas`
 
 ![Challenge 6](./challenge6.png "Challenge 6")
 
 1. Implement above task by setting the views' `frame`s directly.
 2. Implement above task by defining _AutoLayout_ constraints programmatically.
 
 (Make sure to comment out the first implementation once you start working on the second one to avoid confusion.)
 */


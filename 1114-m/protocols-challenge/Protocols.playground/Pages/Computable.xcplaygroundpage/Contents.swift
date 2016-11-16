//: [Previous](@previous)

import Foundation

protocol Computable {
    func compute() -> Int
}

class Sum {
  var numbers = [1,2,3,4,5,6,7,8,9]
}

class Product {
  var numbers = [1,2,3,4,5,6,7,8,9]
}

class CountCharacters {
  var string: String = "odinfeoivneflndwcnervbunlinwe;dqwmid"
}

class Random {
  
}

let sum = Sum()
let product = Product()
let countCharacters = CountCharacters()
let random = Random()

//let arrayOfComputables = [sum, product, countCharacters, random]

/*:
 **Tasks**: 
 1. Uncomment above line and make the code compile (by implementing the `Computable` protocol in all the classes)
 2. Iterate over `arrayOfComputables`, _compute_ each result and print it to the console using `print`
 */


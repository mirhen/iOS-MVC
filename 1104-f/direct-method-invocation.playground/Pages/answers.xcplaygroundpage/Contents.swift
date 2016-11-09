//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

class Person {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func printName(){
        print("My name is \(name)")
    }
    
    func isGreeting(payload: Person) {
        print("greetings \(payload.name)")
    }
}


var john = Person(name: "john")
var jane = Person(name: "jane")

john.printName()

jane.isGreeting(payload: john)

john.isGreeting(payload: jane)
//: [Next](@next)

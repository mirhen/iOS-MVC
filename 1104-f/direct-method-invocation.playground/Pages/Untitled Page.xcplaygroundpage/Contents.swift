//: Playground - noun: a place where people can play

/*:
 **Direct Method Invocation** is probably the simplest form of making two objects communicate. It means that we are _directly invoking a method on an object_, which is the same as saying we are _calling a method on that object_.
 
 Let's also establish the notion of **sending a message to an object** which is equivalent to saying calling a method on that object. Remember that when calling a method, often times we can pass _arguments_ in the method call. These arguments can be considered the "content" or the "payload" of the message that we are sending.

 Consider the following `Calculator` class.
 */
class Calculator {
  
  let capabilities = ["Addition", "Subtraction"]
  
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
/*:
 An object of type  `Calculator` can receive three different kinds of message:
 1. a message called `printCapabilities` that makes it print what kind of mathematical operations it supports
 2. a message called `add` where the sender can attach two `Int`s that will be added and the result is sent back by the calculator to the sender
 3. a message called `add` where the sender can attach two `Int`s that will be subtracted and the result is sent back by the calculator to the sender

 In practice, this looks as follows:
 */

let calculator = Calculator() // create a new calculator

// (1.) send a message to the calculator and make it print what operations it supports
calculator.printCapabilities()

// (2.) send a message to the calculator and make it add numbers 1 and 2; store the calculator's response in a new variable
let additionResult = calculator.add(a: 1, b: 2)

// (3.) send a message to the calculator and make it subtract numbers 2 and 1; store the calculator's response in a new variable
let subtractionResult = calculator.subtract(a: 2, b: 1)

/*:
 ### Challenges:
 1. Create a new class `Person` that has a property `name` of type `String` and that accepts two kinds of messages:
    1. a message that will make the `Person` print its name, e.g.: `"My name is John"`
    2. a message in which the sender can attach another `Person` as payload and the receiving object will _greet_ that `Person` by printing, e.g.: `"Hello, John!"`
 2. Create an object of type `Person`. Let it say its name by sending an appropriate message to it.
 3. Create another object of type `Person`. Make it so that both objects _say hello_ to each other by sending appropriate messages.
 */









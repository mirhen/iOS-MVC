//: [Previous](@previous)

import Foundation

// implicit assignment of raw values
enum Face1: String {
  case happy
  case sad
  case nerd
}
Face1.happy.rawValue

// explicit assignment of raw values
enum Face2: String {
  case happy = ":-)"
  case sad = ":-("
  case nerd = "8-)"
}
Face2.happy.rawValue

// implicit assignment of raw values
enum Weekday1: Int {
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  case sunday
}
Weekday1.monday.rawValue

// explicit assignment of raw values
enum Weekday2: Int {
  case monday = 1
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  case sunday
}
Weekday2.monday.rawValue


/*:
 
 ### Challenges
 
 1. Model a type called `CardinalDirection` using an `enum`. What could be the different _values_ for this type?
 2. Write a function called `help`, that takes a value of type `CardinalDirection` and returns a `String`. This function is supposed to help a lost ship on an ocean to find its way back home (it needs to go north-east). The return value of the function should indicate whether the value that was passed in helps the ship to get home. Use an *arrow unicode character* (`→`, `←`, `↑`, `↓`) in the returned `String` to illustrate the direction on a map, e.g.: `This direction (↓) does not help the ship to get home.`
 3. Model a type called `Month` using an `enum`. That type should represent all the different months in one year. 
 4. Write a function that returns a `String` and indicates at which position this month is inside a year, e.g.: `March is the 3rd month of the year`.
 */

enum CardinalDirection: String{
    case north = "⬆️"
    case south = "⬇️"
    case east = "➡️"
    case west = "⬅️"
}

func help(direction: CardinalDirection) -> String {
    var gettingHome: String
    
    switch direction {
    case .south, .west:
        gettingHome = "This direction (\(direction.rawValue)) does not help the ship get home"
    case .north, .east :
        gettingHome = "This direction (\(direction.rawValue)) does help the ship get home"
    }
    return gettingHome
}

help(direction: .north)

enum Month {
    case january
    case febuary
    case march
    case april
    case may
    case june
    case july
    case augest
    case september
    case october
    case november
    case december
    
}

func getPositionOfMonth(month: Month) -> String {
    var position: String
    
    switch month {
        case .january :
            position = "\(month) is the \(month.hashValue + 1)st month of the year"
        case .febuary:
            position = "\(month) is the \(month.hashValue + 1)nd month of the year"
        case .march:
            position = "\(month) is the \(month.hashValue + 1)rd month of the year"
        default:
            position = "\(month) is the \(month.hashValue + 1)th month of the year"
    }
    
    return position
}

getPositionOfMonth(month: .december)












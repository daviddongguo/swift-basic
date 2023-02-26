//: [Previous](@previous)

import Foundation
import Cocoa

var greeting = "Hello, playground"
/**
 ## Point
 * a struct to define a (x, y) point
 */
struct Point {
    var x: Int
    var y: Int
    init(_ x: Int, _ y: Int){
        self.x = x
        self.y = y
    }
    
    func isNext(_ p2: Point) -> Bool {
        if((self.x - p2.x == 1 || self.x - p2.x == -1) && (self.y == p2.y)){
            return true
        }
        if((self.y - p2.y == 1 || self.y - p2.y == -1) && (self.x == p2.y)){
            return true
        }
        return false
    }
}

let p = Point(1, 3)
p.x
p.y


p.isNext(Point(2, 2))
p.isNext(Point(2, 3))

enum Color {
    case red
    case black
    case white
}

class Car {
    var type: String
    var color: Color
    
    init(_ type: String, _ color: Color){
        self.type = type
        self.color = color
    }
}


let a = Car("Toyota", .red)
a.type = "C"
a.type
a.color = .white
a.color
print(a.color)
//: [Next](@next)

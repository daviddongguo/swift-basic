//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

var uint8A: UInt8 = 0b0000_0111
uint8A | uint8B
var uint8B: UInt8 = 0b0000_0101
uint8A & uint8B

var uint8C: UInt8 = 0b1111_1010
~uint8B

var color = 0x0f1011

(color & 0xff0000) >> 16 //R
(color & 0x00ff00) >> 8   //G
(color & 0x0000ff)  //B

//: [Next](@next)

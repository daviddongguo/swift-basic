//: [Previous](@previous)

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


let binaryString1 = "111"
let binaryString2 = "1"
let intValue1 = Int(binaryString1, radix: 2)!
let intValue2 = Int(binaryString2, radix: 2)!
let intResult = intValue1 + intValue2
let binaryStringResult = String(intResult, radix: 2)
print(resultStr)


//: [Next](@next)

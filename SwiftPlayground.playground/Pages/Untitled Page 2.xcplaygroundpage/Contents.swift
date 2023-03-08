//: [Previous](@previous)

var n = 18

let x: Int = (n / 10 % 2) == 0 ? (n - 1) % 10 + 1  : (10 - n % 10)
let y: Int = (n - 1) / 10 + 1

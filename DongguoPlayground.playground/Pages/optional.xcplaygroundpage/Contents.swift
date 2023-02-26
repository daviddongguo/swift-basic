//: [Previous](@previous)

var intA: Int = 15
var intB: Int?
var intC: Optional<Int> = Optional<Int>(15)

intB == intC
intB
intB = 15
intB == intC
intA == intC
intC = nil
intB = nil
intB == intC
intA == intC
intA == intC ?? 15

var arr: Array<Int?>?
arr = nil
arr?[3] ?? 5


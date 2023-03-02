//: [Previous](@previous)

import Foundation
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
//print(lineBreaks)
let oneCoolDude = "\u{1F60E}"
let myChar = "\u{0061}"
let acute = "\u{0301}"
oneCoolDude
//print(oneCoolDude)


var playground = "playground"
//print("Number of characters in \"\(playground)\": \(playground.count)")
//print("Unicode scalar of each character in a string:")
//for scalar in playground.unicodeScalars {
//        print(" \(scalar) - \(scalar.value) ")
//}

/**
 * A Unicode scalar representes a single character in the string. But they are not the hexadecimal Unicode numbers. Instead, each is represented as an unsigned 32-bit integer.
 
 * aAcute was created using two Unicode scalars, and aAcutePrecomposed only used one. Why does Swift say that they are equivalent? The answer is canonical equivalence.
 */

let aAcutePrecomposed = "\u{00E1}"
let aAcute = "\u{0061}\u{0301}"
let b = (aAcute == aAcutePrecomposed)

//print("aAcute: \(aAcute.count); aAcuteDecomposed: \(aAcutePrecomposed.count)")
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?" // "Voulez-vous un café?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?" // "Voulez-vous un café?"

//if eAcuteQuestion == combinedEAcuteQuestion {
//    print("These two strings are considered equal")
//}

let a = "a"
let capitalA = "A"

if a.compare(capitalA, options: .caseInsensitive) == ComparisonResult.orderedSame {
    //    print("a is equals to A in caseInsensitive mode")
}

a.lowercased() == capitalA.lowercased()
a.uppercased() == capitalA.uppercased()

playground = "abcdefghijklmnopqrstuvwxyz"
let zeroIndex = playground.index(playground.startIndex, offsetBy: 0)
playground[zeroIndex]

let myFirstIndex = playground.index(playground.startIndex, offsetBy: 2)
playground[myFirstIndex]
let myLastIndex = playground.index(myFirstIndex, offsetBy: 1)
playground[myLastIndex]
let range = myFirstIndex...myLastIndex
playground[range]

playground[myFirstIndex...]
playground[...myFirstIndex]
playground[..<myFirstIndex]


playground.insert("😌" ,at: myLastIndex)

playground.starts(with: "abc")
playground.hasPrefix("bc")
playground.contains("cde")
playground.contains("de")


let badStart = """
    one
    two
    
    """
let end = """
    three
    """
//print(badStart + end)




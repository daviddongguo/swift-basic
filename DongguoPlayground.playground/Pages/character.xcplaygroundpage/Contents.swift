import Foundation

// character array
let str = "abcdefghijklmnopqrstuvwxyz"
let characterArray = Array(str)
print(characterArray)

let aScalars = "a".unicodeScalars
let aCode = aScalars[aScalars.startIndex].value
let letters: [Character] = (0..<26).map {
    i in Character(UnicodeScalar(aCode + i)!)
}

print(letters == characterArray)

var playground = "playground"
print("Number of characters in \"\(playground)\": \(playground.count)")
print("Unicode scalar of each character in a string:")
for scalar in playground.unicodeScalars {
        print(" \(scalar) - \(scalar.value) ")
}

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

// With Swift 5, you can use the following Playground sample code in order to get an array of characters from a range of Unicode scalars
// 1.
let unicodeScalarRange: ClosedRange<Unicode.Scalar> = "A" ... "Z"
// 2.
let unicodeScalarValueRange: ClosedRange<UInt32> = unicodeScalarRange.lowerBound.value ... unicodeScalarRange.upperBound.value
// 3.
let unicodeScalarArray: [Unicode.Scalar] = unicodeScalarValueRange.compactMap(Unicode.Scalar.init)
// 4.
let characterArray2: [Character] = unicodeScalarArray.map(Character.init)

print(characterArray2)
/*
 prints: ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
 */

/**
 * Main
 */
main()

func main() {
    let numberArray = [1, 2, 3, 2, 1, 6, 3, 4, 5, 2]
    // 1
    countOccurrencesOfArray(numberArray)
    
    // 2
    print("2_ Second largest element: \(searchingSecondNumber(array: numberArray))")
}

/**
 * 1.
 */
func countOccurrencesOfArray(_ array: [Int]) -> Void {
    var map: [Int: Int] = [:]
    for number in array {
        map[number] = (map[number] ?? 0) + 1
    }
    
    print("1_ Occurrences of each number:")
    for (key, value) in map {
        print("\(key) : \(value)")
    }
}

/**
 * 2
 */
func searchingSecondNumber(array: [Int]) -> Int {
    var firstMax = Int.min
    var secondMax = Int.min
    for number in array {
        if(number > firstMax){
            secondMax = firstMax
            firstMax = number
            continue
        }
        if(number > secondMax){
            secondMax = number
        }
    }
    return secondMax
}

/**
 * 3
 */
func isEqualList(list1: [Int], list2: [Int]) -> Bool {
    let size1 = list1.count
    let size2 = list2.count
    if size1 != size2 {
        return false
    }
    for i in 0..<size1 {
        if list1[i] != list2[i]{
            return false
        }
    }
    return true
}

let list1 = [1, 2, 3, 2, 1, 6, 3, 4, 5, 2]
let list2 = [1, 2, 3, 2, 1, 6, 3, 4, 5, 2]
print("3_ Array equal: \(isEqualList(list1: list1, list2: list2))")

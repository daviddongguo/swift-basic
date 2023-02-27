/**
 * Main
 */
main()

func main() {
    let numberArray = [1, 2, 3, 2, 1, 6, 3, 4, 5, 2]
    // 1
    print("")
    countOccurrencesOfArray(numberArray)
    
    // 2
    print("")
    print("2_ second largest element: \(searchingSecondNumber(array: numberArray))")
    
    // 3
    let list1 = [1, 2, 3, 2, 1, 6, 3, 4, 5, 2]
    let list2 = [1, 2, 3, 2, 1, 6, 3, 4, 5, 2]
    print("")
    print("3_ Array equal: \(isEqualList(list1: list1, list2: list2))")
    
    // 4
    let str1 = ["flower","flow","flight"]
    let str2 = ["dog","racecar","car"]
    print("")
    print("4_ Longest common prefix: \(longestCommonPrefix(str1))")
    print("4_ Longest common prefix: \(longestCommonPrefix(str2))")
    
    // 5
    let s1 = "()"
    let s2 = "()[]{}"
    let s3 = "(]"
    print("")
    print("5_ Valid input string: \(isValid(s1))")
    print("5_ Valid input string: \(isValid(s2))")
    print("5_ Valid input string: \(isValid(s3))")
    
    // 6
    var matrix1 = [[1,2,3],[4,5,6],[7,8,9]]
    var matrix2 = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
    print("")
    print("6_ Rotate matrix:")
    rotateMatrix(&matrix1)
    printMatrix(matrix1)
    print("6_ Rotate matrix:")
    rotateMatrix(&matrix2)
    printMatrix(matrix2)
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



/**
 * 4
 */
func longestCommonPrefix(_ strs: [String]) -> String {
    var longestPrefix = ""
    var shortestSize = Int.max
    for str in strs {
        shortestSize = min(shortestSize, str.count)
    }
    for i in 0..<shortestSize {
        let index = strs[0].index(strs[0].startIndex, offsetBy: i)
        let subSequence = strs[0][...index]
        let prefix = String(subSequence)
        if hasPrefix(strs, prefix: prefix) {
            longestPrefix = prefix
        }
    }
    return longestPrefix
}

func hasPrefix(_ strs: [String], prefix: String) -> Bool {
    for str in strs {
        if !str.hasPrefix(prefix){
            return false
        }
    }
    return true
}



/**
 * 5
 */
func isValid(_ s: String) -> Bool {
    let characters = Array(s)
    var preCharacter = characters[0]
    for i in 1..<s.count {
        if(i % 2 == 0){
            preCharacter = characters[i]
            continue
        }
        if !isClosedCharacter(character1: preCharacter , character2: characters[i]) {
            return false
        }
    }
    return true
}

func isClosedCharacter(character1: Character, character2: Character) -> Bool {
    print("\(character1) : \(character2)")
    switch character1 {
    case "(":
        return character2 == ")"
    case "[":
        return character2 == "]"
    case "{":
        return character2 == "}"
    default:
        return false
    }
}




/**
 * 6
 * firstly, swap items based on the line i = j
 * secondly, swap items based on the line j = size / 2
 */
func rotateMatrix(_ matrix: inout [[Int]])  {
    let size = matrix.count
    for i in 0..<size{
        for j in 0..<i{
            let temp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = temp
        }
    }
    for i in 0..<size{
        for j in 0..<(size / 2){
            let temp = matrix[i][j]
            matrix[i][j] = matrix[i][size - 1 - j]
            matrix[i][size - 1 - j] = temp
        }
    }
}

func printMatrix(_ matrix: [[Int]])  {
    for subArray in matrix {
        print(subArray)
    }
}



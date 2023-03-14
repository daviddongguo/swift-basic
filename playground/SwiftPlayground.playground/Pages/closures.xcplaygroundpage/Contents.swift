//: [Previous](@previous)

var arr = [1, 3, 5, 9, 2]
var arr1 = arr.sorted(by: {i, j in i < j})
var arr2 = arr.sorted(by: <)
var arr3 = arr.sorted { $0 < $1}

let total = arr.reduce(0) {
    (accumulatedProjection: Int, precinctProjection: Int) -> Int in
    return accumulatedProjection + precinctProjection
}
let total01 = arr.reduce(0){$0 + $1}
total01
let average = arr.reduce(0, +) / arr.count

func average(_ numbers: [Int] ) -> Double {
    return Double(numbers.reduce(0, +)) / Double(numbers.count)
}

average(arr)


func downloadDataFromInternet( processData: (String) -> (String) ) {
    
    print("\nDownloading data from internet ...")
    let data = "This text is dowloaded from Internet"
    print("Downloading is finished")
    
    let resultFromClosure = processData(data)
    
    let finalResult = resultFromClosure +
    " Extra analysis applied to returned result from closure, and this is the final result."
    print(finalResult)
}

downloadDataFromInternet {(someData: String) -> String in
    let handledData = someData.uppercased()
    print("\nClosure output I: \(handledData)")
    return handledData
}

downloadDataFromInternet {(someData) in
    let handledData = someData + "Some change"
    print("\nClosure output II: \(someData.hashValue)")
    return handledData
}

//: [Next](@next)

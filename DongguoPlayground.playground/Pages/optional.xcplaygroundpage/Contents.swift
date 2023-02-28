var intA: Int = 15
var intB: Int?
var intC: Optional<Int> = Optional<Int>(15)

//: ## unwrapping
//: - Using an **if else** block
intB = nil
if intB != nil {
    print("not a nil")
}else{
    print("is a nil")
}

//: - Using Forced unwrapping
/*
 * Forced unwrapping is quite contradictory because you're accessing the optional value regardless of its value (nil or not nil). If a nil optional is unwrapped, an error is thrown saying "Unexpectedly found nil while unwrapping an Optional value."
 */
intB = 16
print(intB!)
//intB = nil
//do {
//    print(try intB!)
//} catch {
//    print("is a nil")
//}
//: - Using Optional binding **if-let**
intB = nil
if let unwrapped = intB {
    print("unwrapped value is \(unwrapped)")
}

//: - Using a nil coalescing operator **??**
// works as shorthand notation for the regular if-else block
intB = nil
var result = (intB ?? 0) + 100

//: - Using Optional chaining
var optionalString: String? = "Hello, world!"
optionalString = nil
if let unwrappedString = optionalString?.uppercased() {
    print(unwrappedString) // Output: "HELLO, WORLD!"
} else {
    print("The optional string is nil.")
}

//: ## Define
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


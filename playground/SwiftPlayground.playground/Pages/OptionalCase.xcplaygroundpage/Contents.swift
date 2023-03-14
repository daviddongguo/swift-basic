import Foundation

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
let str = "5"
print(String(describing: Int(str)))
print(Int(str)!)
//intB = nil
// The unwrapping of optionals which are nil does not throw a Swift error (which could be propagated) and cannot be handled with try.
//do {
//    print(try intB!)
//} catch {
//    print("is a nil")
//}

//: - Using Optional Binding **if-let**
/**
 * Safely unwrap optionals by using an if let statement to bind the optional to a new variable.
 * If the optional is nil, then the code in the else block will run.
 */
intB = nil
if let unwrapped = intB {
    print("unwrapped value is \(unwrapped)")
} else {
    print("you use a nil, at using optional binding if let")
}

//: - using Multiple Optional Bindings
/**
 * Multiple optionals can be bound in the same if let statement,
 * separating each binding with “,”.
 * if let statements can also check to see if a boolean expression evaluates to true.
 */
var name: String? = "Codey"
var email: String? = "codey@codecademy.com"

print("\n\t using Multiple Optional Bindings")
if let name = name, let email = email, email.contains("@") {
  print("Welcome \(name)!  Your email address is \(email)")
} else {
  print("Name is nil, email is nil, or the email is invalid")
}


//: - using **guard**

func displayMessageIfValid() {
  guard let name = name, let email = email, email.contains("@") else {
    return
  }
  print("Welcome \(name)!  Your email is \(email)")
}
print("\n\t using Guard statements")
displayMessageIfValid()

//: - Using a nil coalescing operator **??**
/**
 * The nil-coalescing operator ?? unwraps an optional value
 * and provides a default if the optional is nil
 */
intB = nil
var result = (intB ?? 0) + 100

//: - Using Optional chaining **?**
var optionalString: String? = "Hello, world!"
optionalString = nil
if let unwrappedString = optionalString?.uppercased() {
    print(unwrappedString) // Output: "HELLO, WORLD!"
} else {
    print("The optional string is nil.")
}
//: ## Optionals and Functions
/**
 * Functions can take in optional types and return optional types.
 * A function should return nil when it isn’t able to return a sensible instance of the requested type.
 */
func getFirstInitial(_ name: String? = nil) -> String? {
    return name?.uppercased()
}
let uppercasedName = getFirstInitial()

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


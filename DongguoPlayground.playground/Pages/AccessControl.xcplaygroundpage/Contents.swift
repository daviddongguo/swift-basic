
/*:
 # Access Control
 
 ## Access Levels
 - opne / public
 - internal (default)
    - this means only your Swift code can read and write the property.
    - If you ship your code as a framework for others to use, they won’t be able to read the property.
 - fileprivate
 only Swift code in the same file as the type can read and write the property.
 - private
 Mark methods and properties as private to prevent them from being accessed outside of the structure, class, or enumeration’s definition..
 
 */

// public structures can be accessed in other modules
public struct User {
    // internal is the default level of access control
    let name: String
    // fileprivate methods can only be accessed inside of the file they're declared in
    mutating fileprivate func incrementVisitCount() {
        visitCount += 1
    }
    // private properties can only be accessed inside their structure's definition
    private var visitCount = 0
}


/*:
 ## Read-oly Computed Properties
 Read-only computed properties can be accessed, but not assigned to a new value.
 To define a read-only computed property,
 - either use the get keyword without a set keyword,
 - or omit keywords entirely.
 */

struct Room {
    let width: Double
    let height: Double
    // omit keywords entirely
    var squareFeet: Double {
        return width * height
    }
    // only use GET
    var description: String {
        get {
            return "This room is \(width) x \(height)"
        }
    }
}


/*:
 ## Property Observers
 Property observers execute code whenever a property is changed.
 The willSet property observer is triggered right **before** the property is changed
 and creates a newValue variable within the block’s scope.
 The didSet property observer is triggered right **after** the property is changed
 and creates an oldValue within the block’s scope.
 */
struct Employee {
    var hourlyWage = 15 {
        willSet {
            print("The hourly wage is about to be changed from \(hourlyWage) to \(newValue)")
        }
        didSet {
            print("The hourly wage has been changed from \(oldValue) to \(hourlyWage)")
        }
    }
}

// Prints:
// The hourly wage is about to be changed from 15 to 20
// The hourly wage has been changed from 15 to 20
var codey = Employee()
codey.hourlyWage = 20

/*:
  ## Private Setters
  Properties marked as private(set) can be accessed from outside the scope of its structure,
  but only assigned within it. This allows the setter to be more restrictive than the getter.
 */
struct User2 {
    private(set) var name: String
    mutating func updateName(to newName: String) {
        if newName != "" {
            name = newName
        }
    }
}

var currentUser = User2(name: "codey")
currentUser.updateName(to: "Codey")
print(currentUser.name)
// This line doesn't compile because the 'name' setter is inaccessible
// currentUser.name = "Bob"



/*:
  ## Extensions
   The extension keyword is used to continue defining an existing class, structure, or enumeration from anywhere in a codebase.
   Extensions can have new methods, internal types, and computed properties,
   but can’t contain new stored properties.
 */


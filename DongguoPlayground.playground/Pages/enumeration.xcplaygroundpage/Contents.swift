//: [Previous](@previous)

enum LightBulb {
    case on
    case off
    
    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double {
        switch self {
        case .on:
            return ambient + 150.0
        case .off:
            return ambient
        }
    }
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var bulb = LightBulb.on
// Call method and pass argument
bulb.surfaceTemperature(forAmbientTemperature: 77)
bulb.toggle()
bulb.surfaceTemperature(forAmbientTemperature: 77)

//: # Recursive Enumerations
//: A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. You indicate that an enumeration case is recursive by writing "indirect" before it, which tells the compiler to insert the necessary layer of indirection.
enum FamilyTree {
    case noKnownParents
    
    indirect case oneKnownParent(
        name: String,
        ancestors: FamilyTree) // Pay attention that 'ancestors' is type 'FamilyTree' which is our enum, and create a
                               // recursive type referencing
    indirect case twoKnownParents(
        fatherName: String,
        fatherAncestors: FamilyTree,  // Pay attention that 'ancestors' is type 'FamilyTree' which is our enum
        
        motherName: String,
        motherAncestors: FamilyTree)  // Pay attention that 'ancestors' is type 'FamilyTree' which is our enum
}

let fredAncestors = FamilyTree.twoKnownParents(
    fatherName: "Fred Sr.",
    fatherAncestors: .oneKnownParent(name: "Matilta", ancestors: .noKnownParents),
    
    motherName: "Marsha",
    motherAncestors: .noKnownParents
)

//: ## switching on enumerations can also access the ssociated values of a case
enum Dessert {
    case cake(flavor: String)
    case vanillaIceCream(scoops: Int)
    case brownie
}

var customerOrder: Dessert = .cake(flavor: "Red Velvet")
customerOrder = .vanillaIceCream(scoops: 8)


switch customerOrder {
  case let .cake(flavor):
      print("You ordered a \(flavor) cake")
  case let .vanillaIceCream(scoopCount):
      print("You ordered \(scoopCount) scoops of vanilla ice cream")
  case .brownie:
      print("You ordered a brownie")
}

//: ## CaseIterable
enum Season: CaseIterable {
    case winter
    case spring
    case summer
    case fall
}

for season in Season.allCases {
    print(season)
}

//: [Next](@next)

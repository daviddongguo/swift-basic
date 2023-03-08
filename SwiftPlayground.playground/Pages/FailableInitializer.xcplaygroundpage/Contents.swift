let str = "5"
let num = Int(str)

/**
 * a Person struct that must be created using a nine-letter ID strin
 */
struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

let a = Person(id: "123456789")
let b = Person(id: "abc")

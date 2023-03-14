enum E: Error{
    case invalidParameter
    case notFound
    case unexpected(code: Int)
}

func foo(_ bar: String?) throws {
    if let error = bar {
        if error == "error" {
            throw E.invalidParameter
        }
    }
    
    print(bar, "is valid parameter, but don't try to access bar.characters, it crash your code! (if bar == nil)")
    // here is everything OK
    let bar = bar!
    // but here it crash!!
//    _ = bar.characters
}

do {
    try foo("error")
    // next line is not accessible here ...
    try foo(nil)
} catch {
    print("\"error\" as parameter of foo() throws an ERROR!")
}

do {
    // try foo(nil)
    // Fatal error:
    // Unexpectedly found nil while unwrapping an Optional value
    // error: Execution was interrupted,
    // reason: EXC_BREAKPOINT (code=1, subcode=0x192028fa0).
} catch {
    
}


enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

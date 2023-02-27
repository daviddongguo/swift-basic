//: [Previous](@previous)

func listPhotos(_ name: String = "") async -> [String] {
    // ... some asynchronous networking code ...
    print("loading phots list")
    return ["image1", "image2", "image3"]
}

func downloadPhoto(named name: String) async -> String {
    // ... some asynchronous networking code ...
    print("loading \(name)")
    return name
}

func show(_ photos: [String]) {
    print("show pic name:\(photos)")
}

func doInternetWork () {
    print("work start")
    Task {
        let photoNames = await listPhotos("")
        let firstPhoto = await downloadPhoto(named: photoNames[0])
        let secondPhoto = await downloadPhoto(named: photoNames[1])
        let thirdPhoto = await downloadPhoto(named: photoNames[2])
        let photos = [firstPhoto, secondPhoto, thirdPhoto]
        show(photos)
    }
    print("work end")
}


//doInternetWork()

func doTest3 () {
    print("work start")
    Task {
        let photoNames = await listPhotos()
        let photos: [String]
        for name in photoNames {
            async let photo = downloadPhoto(named: name)
        }
    }
    print("work end")
}

doTest3()

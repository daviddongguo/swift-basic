let array = (-1...1).filter { $0 != 0 }


for _ in 1...10 {
    print(array[Int.random(in: 0..<array.count)])
}

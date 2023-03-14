//: [Previous](@previous)
func extendIsland(grid: inout [[Character]], x: Int, y: Int, order: Int) {
    if(y <= grid[x].count - 2 && grid[x][y + 1] == "1"){
        print("go ahead")
        grid[x][y + 1] = Character(UnicodeScalar(order)!)
        extendIsland(grid: &grid, x: x, y: y + 1, order: order)
    }
    if(y >= 1 && grid[x][y - 1] == "1"){
        print("back")
        grid[x][y - 1] = Character(UnicodeScalar(order)!)
        extendIsland(grid: &grid, x: x, y: y - 1, order: order)
    }
    if(x <= grid.count - 2 && grid[x + 1][y] == "1"){
        print("(\(x), \(y))")
        print("go down")
        print("(\(x + 1), \(y))")
        grid[x + 1][y] = Character(UnicodeScalar(order)!)
        extendIsland(grid: &grid, x: x + 1, y: y, order: order)
    }
    if(x >= 1 && grid[x - 1][y] == "1"){
        print("go up")
        grid[x - 1][y] = Character(UnicodeScalar(order)!)
        extendIsland(grid: &grid, x: x - 1, y: y, order: order)
    }
}

func numIslands(_ grid: [[Character]]) -> Int {
    var copiedGrid = [[Character]](repeating: [Character](repeating: "0", count: grid[0].count), count: grid.count)
    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            copiedGrid[i][j] = grid[i][j]
        }
    }

    var num: Int = 1
    for x in 0..<grid.count {
        for y in 0..<grid[x].count {
            if(copiedGrid[x][y] == "1"){
                num += 1
                print(copiedGrid[x][y])
                copiedGrid[x][y] = Character(UnicodeScalar(num)!)
                print(num)
                print("(\(x), \(y))")
                extendIsland(grid: &copiedGrid, x: x, y: y, order: num)
            }
        }
    }
        print("")
    for i in copiedGrid {
        print(i)
    }
        print("")
    return num - 1
}


var grid: [[Character]] = [
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]]
numIslands( grid)

for x in grid {
    print(x)
}
//: [Next](@next)

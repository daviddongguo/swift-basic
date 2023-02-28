
struct Menu {
  var menuItems = ["Fries", "Burgers"]

  mutating func addToMenu(dish: String) {
    self.menuItems.append(dish)
  }
}

var dinerMenu = Menu()

// Prints: ["Fries", "Burgers", "Toast"]
dinerMenu.addToMenu(dish: "Toast")
print(dinerMenu.menuItems)


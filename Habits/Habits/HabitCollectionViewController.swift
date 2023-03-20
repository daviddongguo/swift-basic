//
//  HabitCollectionViewController.swift
//  Habits
//
//  Created by map07 on 2023-03-20.
//

import UIKit

class HabitCollectionViewController: UIViewController {
    
    typealias DataSourceType = UICollectionViewDiffableDataSource<ViewModel.Section, ViewModel.Item>
    var habitsRequestTask: Task<Void, Never>? = nil
    deinit { habitsRequestTask?.cancel() }
    
    enum ViewModel {
        enum Section: Hashable, Comparable {
            static func < (lhs: HabitCollectionViewController.ViewModel.Section, rhs: HabitCollectionViewController.ViewModel.Section) -> Bool {
                switch(lhs, rhs) {
                case (.category(let l), .category(let r)):
                    return l.name < r.name
                case (.favorites, _):
                    return true
                case (_, favorites):
                    return false
                }
            }
            
            case favorites
            case category(_ category: Category)
        }
            typealias Item = Habit
    }
    
    struct Model {
        var habitsByName = [String: Habit]()
        var favoriteHabits: [Habit] {
            return Settings.shared.favoriteHabits
        }
    }
    
    var dataSource: DataSourceType!
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func update() {
        habitsRequestTask?.cancel()
        habitsRequestTask = Task {
            if let habits = try? await HabitRequest().send() {
                self.model.habitsByName = habits
            } else {
                self.model.habitsByName = [:]
            }
            self.updateCollectionView()
            
            habitsRequestTask = nil
        }
    }
    
    func updateCollectionView() {
        let itemsBySection = model.habitsByName.values.reduce(into: [ViewModel.Section: [ViewModel.Item]]()) { partial, habit in
            let item = habit
            let section: ViewModel.Section
            if model.favoriteHabits.contains(habit) {
                section = .favorites
            } else {
                section = .category(habit.category)
            }
            
            partial[section, default: []].append(item)
        }
        
        let sectionIDs = itemsBySection.keys.sorted()
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

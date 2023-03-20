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
        enum Section: Hashable{
            case favorites
            case category(_ category: Category)
        }
        
        typealias Item = Habit
    }
    
    struct Model {
        var habitsByName = [String: Habit]()
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

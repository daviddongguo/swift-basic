//
//  MainPageViewController.swift
//  dongguo
//
//  Created by david on 2023-03-19.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBAction func scoreButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toResult", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func unwindToMainPageViewController(_ unwindSegue: UIStoryboardSegue) {
            
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

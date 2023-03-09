//
//  ViewController.swift
//  Animator
//
//  Created by map07 on 2023-03-09.
//

import UIKit

class ViewController: UIViewController {
    
    var animator: UIViewPropertyAnimator!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        
        slider.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        slider.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        let redBox = UIView(frame: CGRect(x: -64, y: 0, width: 128, height: 128))
        redBox.translatesAutoresizingMaskIntoConstraints = false
        redBox.backgroundColor = UIColor.red
        redBox.center.y = view.center.y - 160
        view.addSubview(redBox)
        
        /**
         * We’re going to make the animation move the box from the left to the right,
         * while spinning around and scaling down to nothing.
         * All that will happen over two seconds,
         * with an ease-in-ease-out curve
         */
        animator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut) { [unowned self, redBox] in
            redBox.center.x = self.view.frame.width
            redBox.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
        }
        animator.startAnimation()

    }
    
    /**
     * Feed the slider’s value property – the number from 0.0 to 1.0 – directly into the fractionComplete property of our UIViewPropertyAnimator, which controls how much of the animation has happened, and UIKit will take care of the rest for us.
     */
    @objc func sliderChanged(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
    }


}


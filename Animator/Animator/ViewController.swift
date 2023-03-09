//
//  ViewController.swift
//  Animator
//
//  Created by map07 on 2023-03-09.
//

import UIKit

class ViewController: UIViewController {
    
    var animator1: UIViewPropertyAnimator!
    var animator2: UIViewPropertyAnimator!
    var alpha: Double = 0
    var redBox: UIView!
    
    var animation_active = false
    let animation_duration = 2 //For easy maintenance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Slider
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        slider.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        slider.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        let buttonSize = view.frame.width / 5
        let runButton = UIButton(frame: CGRect(x: 0, y: view.frame.size.height - buttonSize * 5, width: buttonSize * 3, height: buttonSize))
        runButton.setTitle("=", for: .normal)
        runButton.setTitleColor(.black, for: .normal)
        runButton.backgroundColor = .cyan
        runButton.layer.borderWidth = 2
        runButton.layer.borderColor = UIColor.black.cgColor
        runButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        view.addSubview(runButton)
        
        redBox = UIView(frame: CGRect(x: -64, y: 0, width: 128, height: 128))
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
        animator1 = UIViewPropertyAnimator(duration: 2, curve: .easeInOut) { [unowned self, redBox] in
            redBox!.center.x = self.view.frame.width
            redBox!.alpha = 0
//            redBox!.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
        }
        animator2 = UIViewPropertyAnimator(duration: 2, curve: .easeInOut) { [unowned self, redBox] in
            redBox!.center.x = self.view.frame.width
            redBox!.alpha = 1
//            redBox!.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
        }
        //        animator.startAnimation()
        
    }
    
    /**
     * Feed the slider’s value property – the number from 0.0 to 1.0 – directly into the fractionComplete property of our UIViewPropertyAnimator, which controls how much of the animation has happened, and UIKit will take care of the rest for us.
     */
    @objc func sliderChanged(_ sender: UISlider) {
        animator1.fractionComplete = CGFloat(sender.value)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        animator1.startAnimation()
//        fadeSequence(redBox, repeat: 3)
    }
    func swipe_down() {
        if animation_active == false {
            animation_active == true
            //Animation code goes here. Variable 'animation_active' should be used when performing the animation for easy matinence
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(animation_duration), execute: {
                self.animator1!.startAnimation()
                self.animation_active = false
            })
        }
    }
     

    func swipe_up() { //This is exactly the same as swipe_up. Yet it will prevent the swipe animation from occuring when the swipe down animation is occuruing thanks to the variable 'animation_active'
        if animation_active == false {
            animation_active == true
            //Animation code goes here. Variable 'animation_active' should be used when performing the animation for easy matinence
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(animation_duration), execute: {
                self.animator2!.startAnimation()
                self.animation_active = false
            })
        }
    }
    
    
//    func fadeIn(_ view: UIView, completion: @escaping () -> Void) {
//        guard alpha == 0 else { return completion() }
//        UIViewPropertyAnimator.runningPropertyAnimator(
//            withDuration: 3.0, delay: 2.0, options:[.curveLinear],
//            animations: {
//                view.alpha = 1
//            },
//            completion: completion
//        )
//    }
//
//    func fadeOut(_ view: UIView, completion: @escaping () -> Void) {
//        guard alpha == 1 else { return completion() }
//        UIViewPropertyAnimator.runningPropertyAnimator(
//            withDuration: 3.0, delay: 2.0, options:[.curveLinear],
//            animations: {
//                view.alpha = 0
//            },
//            completion: completion
//        )
//    }
//
//    func fadeSequence(_ view: UIView, repeat n: Int = 1) {
//        guard n > 0 else { return }
//        fadeIn(view) {
//            fadeOut(view) {
//                fadeSequence(view, repeat: n-1)
//            }
//        }
//    }
    
}


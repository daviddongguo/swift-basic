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
        
        let layer = CALayer()
        layer.backgroundColor = UIColor.systemRed.cgColor
        layer.frame = CGRect(x: 100, y: 100, width: 120, height: 120)
        view.layer.addSublayer(layer)
        
        // Slider
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        slider.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        slider.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        // Button
        let buttonSize = view.frame.width / 5
        let runButton = UIButton(frame: CGRect(x: 0, y: view.frame.size.height - buttonSize * 5, width: buttonSize * 3, height: buttonSize))
        runButton.setTitle("=", for: .normal)
        runButton.setTitleColor(.black, for: .normal)
        runButton.backgroundColor = .cyan
        runButton.layer.borderWidth = 2
        runButton.layer.borderColor = UIColor.black.cgColor
        runButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        view.addSubview(runButton)
        
        // RedBox
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
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0 ) {self.animateMovement(layer)}
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1, animations: {
            self.bgImage.alpha = 0.6
        }){ (true) in
            UIView.animate(withDuration: 1, animations: {
                self.titleLable.alpha = 1
            }))
            
        }
    }
    
    func animateFun() {
        
    }
    
    func animateMovement(_ layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: layer.frame.origin.x + layer.frame.width / 2, y: layer.frame.origin.y)
        animation.toValue = CGPoint(x: 300, y: 400)
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        layer.add(animation, forKey: nil)
        
        
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
    
    
    
    

    
}


//
//  ViewController.swift
//  Caculator
//
//  Created by map07 on 2023-03-02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var holder: UIView!
    
    let firstName = "DONG"
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var resultNumber: Int = 0
    var currentOperatorIndex: Int? = nil
    
    let operators = ["+", "-", "*", "/"]
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Dongguo"
        label.textColor = .cyan
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-Bold", size: 64)
        return label
    }()
    
    private var firstLable: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica-Bold", size: 64)
        return label
    }()
    
    private var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica-Bold", size: 64)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupNumberPad()
    }
    
    
    
    private func setupNumberPad() {
        let buttonSize: CGFloat = view.frame.size.width / 4
        
        // 0
        var text = "0"
        var tag = 1
        createNumberButton(buttonSize, x: 0, y: holder.frame.size.height - buttonSize, width: buttonSize * 2, backgroundColor: .lightGray, text: text, tag: tag)
        // .
        text = "."
        tag = 100
        createNumberButton(buttonSize, x: buttonSize * 2, y: holder.frame.size.height - buttonSize, width: buttonSize, backgroundColor: .lightGray, text: text, tag: tag)
        // 1...9
        for i in 1...9 {
            text = "\(i)"
            tag = i + 1
            let x = buttonSize * CGFloat( (i - 1) % 3 )
            let y = holder.frame.size.height - buttonSize * CGFloat( (i - 1) / 3 + 2)
            createNumberButton(buttonSize, x: x, y: y, width: buttonSize, backgroundColor: .lightGray, text: text, tag: tag)
        }
        
        // +, -, *, /
        for i in 0..<operators.count {
            text = "\(operators[i])"
            tag = i + 1
            let x = buttonSize * 3
            let y = holder.frame.size.height - buttonSize * CGFloat( i + 1)
            createOperatorbutton(buttonSize, x: x, y: y, width: buttonSize, backgroundColor: .systemRed, text: text, tag: tag)
        }
        
        // =
        let runButton = UIButton(frame: CGRect(x: 0, y: holder.frame.size.height - buttonSize * 5, width: buttonSize * 3, height: buttonSize))
        runButton.setTitle("=", for: .normal)
        runButton.setTitleColor(.black, for: .normal)
        runButton.backgroundColor = .cyan
        runButton.layer.borderWidth = 2
        runButton.layer.borderColor = UIColor.black.cgColor
        runButton.addTarget(self, action: #selector(runButtonPressed), for: .touchUpInside)
        holder.addSubview(runButton)
        
        // AC
        let clearButton = UIButton(frame: CGRect(x: buttonSize * 3, y: holder.frame.size.height - buttonSize * 5, width: buttonSize, height: buttonSize))
        clearButton.setTitle("AC", for: .normal)
        clearButton.setTitleColor(.black, for: .normal)
        clearButton.backgroundColor = .systemRed
        clearButton.layer.borderWidth = 2
        clearButton.layer.borderColor = UIColor.black.cgColor
        clearButton.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
        holder.addSubview(clearButton)
        
        nameLabel.frame = CGRect(x: 20,
                                 y: clearButton.frame.origin.y - 240.0,
                                 width: view.frame.size.width - 24,
                                 height: 80)
        holder.addSubview(nameLabel)
        
        firstLable.frame = CGRect(x: 20,
                                  y: clearButton.frame.origin.y - 160.0,
                                  width: view.frame.size.width - 24,
                                  height: 80)
        holder.addSubview(firstLable)
        
        secondLabel.frame = CGRect(x: 20,
                                   y: clearButton.frame.origin.y - 80.0,
                                   width: view.frame.size.width - 24,
                                   height: 80)
        holder.addSubview(secondLabel)
        
    }
    
    // Actions
    @objc func clearResult() {
        secondLabel.text = "0"
        firstLable.text = ""
        firstNumber = 0
        secondNumber = 0
        nameLabel.text = firstName
    }
    
    @objc func numberPressed(_ sender: UIButton) {
        let tag = sender.tag - 1
        // press number after pressing operator
        if operators.contains(secondLabel.text ?? ""){
            firstLable.text = "\(firstNumber)"
            nameLabel.text = secondLabel.text
            secondLabel.text = "0"
        }
        //TODO: press dot button
        if tag > 9 {
            return
        }
        
        if secondLabel.text == "0" {
            secondLabel.text = "\(tag)"
        }else if let wrapped = secondLabel.text{
            secondLabel.text = "\(wrapped)\(tag)"
        }
    }
    
    
    @objc func operatorButtonPressed(_ sender: UIButton) {
        let tag = sender.tag - 1
        currentOperatorIndex = tag
        if let number = Int(secondLabel.text ?? "") {
            firstNumber = number
            firstLable.text = ("\(firstNumber)")
            secondLabel.text = "\(operators[tag])"
        }
    }
    
    @objc func runButtonPressed(_ sender: UIButton) {
        if let number = Int(secondLabel.text ?? "") {
            secondNumber = number
            switch currentOperatorIndex {
            case 0 :
                firstLable.text = "\(firstNumber) + \(secondNumber)"
                secondLabel.text = "= \(firstNumber + secondNumber)"
            case 1 :
                firstLable.text = "\(firstNumber) - \(secondNumber)"
                secondLabel.text = "= \(firstNumber - secondNumber)"
            case 2 :
                firstLable.text = "\(firstNumber) * \(secondNumber)"
                secondLabel.text = "= \(firstNumber * secondNumber)"
            case 3 :
                firstLable.text = "\(firstNumber) / \(secondNumber)"
                secondLabel.text = "= \(firstNumber / secondNumber)"
            default :
                break
            }
            nameLabel.text = "\(firstName)"
        }
        
    }
    
    fileprivate func createNumberButton(_ buttonSize: CGFloat, x: Double, y: Double, width: Double, backgroundColor: UIColor, text: String, tag: Int) {
        let button = UIButton(frame: CGRect(x: x, y: y, width: width, height: buttonSize))
        button.tag = tag
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(numberPressed(_ :)), for: .touchUpInside)
        holder.addSubview(button)
    }
    
    fileprivate func createOperatorbutton(_ buttonSize: CGFloat, x: Double, y: Double, width: Double, backgroundColor: UIColor, text: String, tag: Int) {
        let button = UIButton(frame: CGRect(x: x, y: y, width: width, height: buttonSize))
        button.tag = tag
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(operatorButtonPressed(_ :)), for: .touchUpInside)
        holder.addSubview(button)
    }
    
}


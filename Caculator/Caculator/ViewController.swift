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
    let secondName = "WU"
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var resultNumber: Int = 0
    var currentOperator: Int? = nil
    
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
        
        let zeroButton = UIButton(frame: CGRect(x: 0, y: holder.frame.size.height - buttonSize, width: buttonSize * 2, height: buttonSize))
        zeroButton.tag = 1
        zeroButton.setTitle("0", for: .normal)
        zeroButton.setTitleColor(.black, for: .normal)
        zeroButton.backgroundColor = .lightGray
        zeroButton.layer.borderWidth = 2
        zeroButton.layer.borderColor = UIColor.black.cgColor
        zeroButton.addTarget(self, action: #selector(numberPressed(_ :)), for: .touchUpInside)
        holder.addSubview(zeroButton)
        
        let dotButton = UIButton(frame: CGRect(x: buttonSize * 2, y: holder.frame.size.height - buttonSize, width: buttonSize, height: buttonSize))
        dotButton.setTitle(".", for: .normal)
        dotButton.setTitleColor(.black, for: .normal)
        dotButton.backgroundColor = .lightGray
        dotButton.layer.borderWidth = 2
        dotButton.layer.borderColor = UIColor.black.cgColor
        holder.addSubview(dotButton)
        
        
        
        for x in 1...3 {
            let numberButton = UIButton(frame: CGRect(x: buttonSize * CGFloat(x - 1), y: holder.frame.size.height - buttonSize * 2, width: buttonSize , height: buttonSize))
            numberButton.tag = x + 1
            numberButton.setTitle("\(x)", for: .normal)
            numberButton.setTitleColor(.black, for: .normal)
            numberButton.backgroundColor = .lightGray
            numberButton.layer.borderWidth = 2
            numberButton.layer.borderColor = UIColor.black.cgColor
            numberButton.addTarget(self, action: #selector(numberPressed(_ :)), for: .touchUpInside)
            holder.addSubview(numberButton)
        }
        
        for x in 4...6 {
            let numberButton = UIButton(frame: CGRect(x: buttonSize * CGFloat(x - 4), y: holder.frame.size.height - buttonSize * 3, width: buttonSize , height: buttonSize))
            numberButton.tag = x + 1
            numberButton.setTitle("\(x)", for: .normal)
            numberButton.setTitleColor(.black, for: .normal)
            numberButton.backgroundColor = .lightGray
            numberButton.layer.borderWidth = 2
            numberButton.layer.borderColor = UIColor.black.cgColor
            numberButton.addTarget(self, action: #selector(numberPressed(_ :)), for: .touchUpInside)
            holder.addSubview(numberButton)
        }
        
        for x in 7...9 {
            let numberButton = UIButton(frame: CGRect(x: buttonSize * CGFloat(x - 7), y: holder.frame.size.height - buttonSize * 4, width: buttonSize , height: buttonSize))
            numberButton.tag = x + 1
            numberButton.setTitle("\(x)", for: .normal)
            numberButton.setTitleColor(.black, for: .normal)
            numberButton.backgroundColor = .lightGray
            numberButton.layer.borderWidth = 2
            numberButton.layer.borderColor = UIColor.black.cgColor
            numberButton.addTarget(self, action: #selector(numberPressed(_ :)), for: .touchUpInside)
            holder.addSubview(numberButton)
        }
        
        //        let functions = ["^", "+/-", "%"]
        //        for i in 0..<functions.count {
        //            let numberButton = UIButton(frame: CGRect(x: buttonSize * CGFloat(i), y: holder.frame.size.height - buttonSize * 5, width: buttonSize , height: buttonSize))
        //            numberButton.setTitle("\(functions[i])", for: .normal)
        //            numberButton.setTitleColor(.black, for: .normal)
        //            numberButton.backgroundColor = .lightGray
        //            numberButton.layer.borderWidth = 2
        //            numberButton.layer.borderColor = UIColor.black.cgColor
        //            holder.addSubview(numberButton)
        //        }
        
        let runButton = UIButton(frame: CGRect(x: 0, y: holder.frame.size.height - buttonSize * 5, width: buttonSize * 3, height: buttonSize))
        runButton.setTitle("=", for: .normal)
        runButton.setTitleColor(.black, for: .normal)
        runButton.backgroundColor = .cyan
        runButton.layer.borderWidth = 2
        runButton.layer.borderColor = UIColor.black.cgColor
        runButton.addTarget(self, action: #selector(runButtonPressed), for: .touchUpInside)
        holder.addSubview(runButton)
        
        let clearButton = UIButton(frame: CGRect(x: buttonSize * 3, y: holder.frame.size.height - buttonSize * 5, width: buttonSize, height: buttonSize))
        clearButton.setTitle("AC", for: .normal)
        clearButton.setTitleColor(.black, for: .normal)
        clearButton.backgroundColor = .systemRed
        clearButton.layer.borderWidth = 2
        clearButton.layer.borderColor = UIColor.black.cgColor
        clearButton.addTarget(self, action: #selector(clearResult), for: .touchUpInside)
        holder.addSubview(clearButton)
        
        for i in 0..<operators.count {
            let operatorButton = UIButton(frame: CGRect(x: buttonSize * 3, y: holder.frame.size.height - buttonSize * CGFloat(i + 1), width: buttonSize , height: buttonSize))
            operatorButton.tag = i + 1
            operatorButton.setTitle("\(operators[i])", for: .normal)
            operatorButton.setTitleColor(.black, for: .normal)
            operatorButton.backgroundColor = .systemRed
            operatorButton.layer.borderWidth = 2
            operatorButton.layer.borderColor = UIColor.black.cgColor
            operatorButton.addTarget(self, action: #selector(operatorButtonPressed), for: .touchUpInside)
            holder.addSubview(operatorButton)
        }
        
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
        
        // Actions
    }
    
    @objc func clearResult() {
        secondLabel.text = "0"
        firstLable.text = ""
        firstNumber = 0
        secondNumber = 0
        nameLabel.text = firstName
    }
    
    @objc func numberPressed(_ sender: UIButton) {
        let tag = sender.tag - 1
        if operators.contains(secondLabel.text ?? ""){
            firstLable.text = "\(firstNumber)"
            nameLabel.text = secondLabel.text
            secondLabel.text = "0"
        }
        
        if secondLabel.text == "0" {
            secondLabel.text = "\(tag)"
        }else if let wrapped = secondLabel.text{
            secondLabel.text = "\(wrapped)\(tag)"
        }
        
    }
    
    
    @objc func operatorButtonPressed(_ sender: UIButton) {
        let tag = sender.tag - 1
        currentOperator = tag
        
        if let number = Int(secondLabel.text ?? "") {
            firstNumber = number
            firstLable.text = ("\(firstNumber)")
            secondLabel.text = "\(operators[tag])"
        }
        
        
    }
    
    @objc func runButtonPressed(_ sender: UIButton) {
        if let number = Int(secondLabel.text ?? "") {
            secondNumber = number
            switch currentOperator {
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
        }
        
    }
    
    
    
}


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
    var firstNumber = 0.0
    var secondNumber = 0.0
    var resultNumber = 0.0
    var currentOperator: Operator?
    
    enum Operator: Int {
        case add, subtract, multiply, divide
    }
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "\(secondName) \(firstName)"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica-Bold", size: 64)
        return label
    }()
    
    private var resultLabel: UILabel = {
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
        
        let operators = ["+", "-", "*", "/"]
        for i in 0..<operators.count {
            let numberButton = UIButton(frame: CGRect(x: buttonSize * 3, y: holder.frame.size.height - buttonSize * CGFloat(i + 1), width: buttonSize , height: buttonSize))
            numberButton.tag = i + 1
            numberButton.setTitle("\(operators[i])", for: .normal)
            numberButton.setTitleColor(.black, for: .normal)
            numberButton.backgroundColor = .systemRed
            numberButton.layer.borderWidth = 2
            numberButton.layer.borderColor = UIColor.black.cgColor
            holder.addSubview(numberButton)
        }
        
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
        
        
        
        resultLabel.frame = CGRect(x: 20,
                                   y: clearButton.frame.origin.y - 80.0,
                                   width: view.frame.size.width - 24,
                                   height: 80)
        holder.addSubview(resultLabel)
        
        // Actions
    }
    
    @objc func clearResult() {
        resultLabel.text = "0"
    }
    
    @objc func numberPressed(_ sender: UIButton) {
        let tag = sender.tag - 1
        if resultLabel.text == "0" {
            resultLabel.text = "\(tag)"
        }else if let wrapped = resultLabel.text{
                resultLabel.text = "\(wrapped)\(tag)"
        }
        
    }
    
    
    @objc func operatorPressed(_ sender: UIButton) {
        let tag = sender.tag - 1
        if let wrapped = Operator(rawValue: tag){
            currentOperator = wrapped
            if let doubleNumber = Double(resultLabel.text ?? "") {
                firstNumber = doubleNumber
            }
        }
        
        
    }
    
    @objc func runButtonPressed(_ sender: UIButton) {
        if(secondNumber == 0.0){
            resultLabel.text = String(firstNumber)
        }
    }
    
    
    
}


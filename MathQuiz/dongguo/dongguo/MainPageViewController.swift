import UIKit

class MainPageViewController: UIViewController {
    
    var server: MathQuizServer!
    var currentQuiz: MathQuiz? = nil
    
    var signRight = "😀"
    var signWrong = "🎲"
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet weak var generateQuizButton: UIButton!
    @IBOutlet weak var validateQuizbutton: UIButton!
    
    @IBAction func generateButtonPressed(_ sender: Any) {
        currentQuiz = server.generateQuiz()
        updateUI()
    }
    
    func updateUI() {
        userAnswerTextField.text = ""
        questionLabel.text = currentQuiz?.description ?? ""
        
        generateQuizButton.isEnabled = false
        validateQuizbutton.isEnabled = false
    }
    
    @IBAction func validateButtonPressed(_ sender: UIButton) {
        guard let quizText = questionLabel.text, !quizText.contains(signRight)   && !quizText.contains(signWrong) else {
            return
        }
        guard let answer = userAnswerTextField.text, !answer.isEmpty,
              let quiz = currentQuiz else {
            return
        }
        quiz.enterUserAnswer(answer)
        
        if quiz.IsRightAnswer() {
            questionLabel.text = String(quizText.dropLast()) + "\(answer) " + signRight
            questionLabel.textColor = .green
            server.updateDifficulty(server.difficulty + 1)
        }else{
            questionLabel.text = String(quizText.dropLast()) + "\(answer) " + signWrong
            questionLabel.textColor = .red
        }
        
        sender.isEnabled = false
        generateQuizButton.isEnabled = true
    }
    
    
    
    @IBAction func clearButtonSinglePressed(_ sender: Any) {
        guard let text = userAnswerTextField?.text else {
            return
        }
        userAnswerTextField.text = String(text.dropLast())
        print("clean single character")
        
    }
    
    @IBAction func clearButtonDoublePressed(_ sender: Any) {
        userAnswerTextField.text = ""
        print("clean all")
    }
    
    
    @IBAction func scoreButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toResult", sender: self)
    }
    
    @IBAction func finishButtonPressed(_ sender: Any) {
        server.difficulty += 5
        print(server.deguInfo)
        print("add difficulty to : \(String(describing: server.difficulty))")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init quizzes
        server.difficulty = 100
        server = MathQuizServer()
        server.difficulty = 25
        var _ = server.generateQuiz()
        server.difficulty = 1
        var _ = server.generateQuiz()
        currentQuiz =  server.generateQuiz()
        updateUI()
        for button in numberButtons {
            button.addTarget(self, action: #selector(numberButtonPressed(_ :)), for: .touchUpInside)
        }
    }
    
    
    
    @objc func numberButtonPressed(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text,
              var answerText = userAnswerTextField.text else {
            return
        }
        
        // validate user input
        switch text {
        case "-" :
            answerText += answerText.isEmpty ? text : ""
        case "." :
            answerText += answerText.contains(".") ? "" : text
        default :
            answerText += (answerText == "0") ? "" : text
        }
        
        userAnswerTextField.text = answerText
        validateQuizbutton.isEnabled = true
    }
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ResultPageViewController {
            destination.list = self.server.quizs
            destination.score = self.self.server.scoreString
        }
        
    }
    
    @IBAction func unwindToMainPageViewController(_ unwindSegue: UIStoryboardSegue) {
        
        // from result view controller
        if unwindSegue.identifier == "fromResult" {
            let vc = unwindSegue.source as! ResultPageViewController
            mainTitleLabel.text = "\(vc.registerTextField.text ?? "") : \(vc.scoreLabel.text ?? "")"
        }
        
        // fromRedo insid cell
        if unwindSegue.identifier == "fromRedo" {
            let vc = unwindSegue.source as! ResultPageViewController
            currentQuiz = vc.currentQuiz
            currentQuiz?.userAnswer = nil
            updateUI()
        }
    }
    
}

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var boardHolder: UIView!
    
    @IBOutlet weak var diceHolder: UIView!
    
    var dice = RandomDice()
    var map = Board().map
    var currentIndex = 0
    var players: [Player] = []
    
    var diceWidthSize: Double = 0
    var diceUI: UIButton!
    var boardCellSize: Double = 0
    var playerButtons: [UIButton] = []
    var currentPlayerUI: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for player in Setting.playerList {
            playerButtons.append(createPlayerButton(n: player.position, type: player.type, name: player.name))
            players.append(player)
        }
        currentPlayerUI = playerButtons[0]
        
        diceWidthSize = diceHolder.frame.size.width
        boardCellSize = boardHolder.frame.size.width / 10
        diceUI = createDivce()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupBoardPad()
    }
    
    private func setupBoardPad() {
        for button in playerButtons {
            boardHolder.addSubview(button)
        }
        for i in 0..<Setting.numberOfPlayer {
            players[i].position = Setting.startPosition
        }
        diceHolder.addSubview(diceUI)
    }
    
    
    private func createDivce() -> UIButton {
        let ui = UIButton( frame: CGRect( x: 0, y: 0, width: diceWidthSize, height: diceWidthSize))
        ui.setBackgroundImage(Setting.diceArray[5], for: UIControl.State.normal)
        ui.addTarget(self, action: #selector(dicePressed),  for: .touchUpInside)
        return  ui
    }
    
    @objc func dicePressed(_ diceUI: UIButton) {
        let steps: Int =  dice.roll()
        let currentPlayer = players[currentIndex]
        let startPosition: Int = currentPlayer.position
        currentPlayerUI = playerButtons[currentIndex]
        
        // change dice background image and disable it until playerUI finish moving
        diceUI.setBackgroundImage(Setting.diceArray[steps - 1], for: UIControl.State.normal)
        diceUI.isEnabled = false
        
        let debuggingMsg = "\(currentPlayer.name) get \(steps) steps from  \(startPosition)"
        print(debuggingMsg)
        var endPosition: Int = currentPlayer.position + steps
        
        // move current player one step by one stey
        let animator = createMoveAnimator(currentPlayerUI, to: startPosition + 1)
        var preAnimator = animator
        if steps >= 2 {
            for i in 2...steps {
                let currentAnimator = createMoveAnimator(currentPlayerUI, to: startPosition + i)
                preAnimator.addCompletion{_ in currentAnimator.startAnimation()}
                preAnimator = currentAnimator
            }
        }
        
        
        // continue move based on the map of board
        repeat {
            guard let unwrapped = map[endPosition] else {
                addCompletionForNextPlayer(to: preAnimator)
                break
            }
            endPosition = unwrapped
            let animator = createMoveAnimator(currentPlayerUI, to: endPosition)
            preAnimator.addCompletion{_ in animator.startAnimation()}
            addCompletionForNextPlayer(to: preAnimator)
        } while true
        animator.startAnimation()
        
        // modify player data
        players[currentIndex].moveTo(endPosition)
        
        
        if currentPlayer.isWin {
            diceUI.isEnabled = false
            print("\(currentPlayer.name) position:  \(currentPlayer.position)")
        }
    }
    
    func addCompletionForNextPlayer(to animator: UIViewPropertyAnimator) {
        animator.addCompletion{_ in self.diceUI.isEnabled = true}
        animator.addCompletion{_ in self.currentPlayerUI.backgroundColor = UIColor.clear}
        animator.addCompletion{_ in self.currentIndex = (self.currentIndex + 1) % Setting.numberOfPlayer}
        animator.addCompletion{_ in self.playerButtons[self.currentIndex].backgroundColor = .gray}
    }
    
    

    func computerXY(from position: Int) -> (x: Int, y: Int) {
        let x = ((position - 1) / 10 % 2 == 0) ? (position - 1) % 10 : 9 - (position - 1) % 10
        let y = 9 - (position - 1) / 10
        return (x: x, y: y)
    }
    
    func createMoveAnimator(_ button: UIButton, to end: Int ) ->  UIViewPropertyAnimator{
        
        let (endX, endY) = computerXY(from: end)
        
        let animator: UIViewPropertyAnimator = UIViewPropertyAnimator(
            duration: 10.0 / Double(Setting.gameSpeed),
            curve: .linear,
            animations: {[self] in
                button.frame = CGRectMake(self.boardCellSize * Double(endX), self.boardCellSize * Double(endY), self.boardCellSize, self.boardCellSize )
                button.backgroundColor = .gray
            }
        )
        
        return animator
    }
    
    
    
    private func createPlayerButton(n: Int, type: Int, name: String) -> UIButton {
        let image = Setting.palyerImages[type]
        let (x, y) = computerXY(from: n)
        let button = UIButton(
            frame: CGRect(
                x: boardCellSize * Double(x),
                y: boardCellSize * Double(y),
                width: boardCellSize,
                height: boardCellSize))
        button.setTitle(name, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setBackgroundImage(image, for: UIControl.State.normal)
        
        return  button
    }    
}


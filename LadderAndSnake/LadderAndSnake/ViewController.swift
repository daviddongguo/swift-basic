import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var holder: UIView!
    
    @IBOutlet weak var diceContainer: UIView!
    
    var dice = RandomDice()
    var map = Board().map
    var currentIndex = 0
    var players: [Player] = []
    // goto line 49
    
    
    var diceWidthSize: Double = 0
    var diceButton: UIButton!
    var cellSize: Double = 0
    var playerButtons: [UIButton] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        for player in Setting.playerList {
            playerButtons.append(createPlayerButton(n: player.position, type: player.type, name: player.name))
            players.append(player)
        }
        
        diceWidthSize = diceContainer.frame.size.width
        cellSize = holder.frame.size.width / 10
        diceButton = createDivce()
        
    }
    
    private func createDivce() -> UIButton {
        let ui = UIButton( frame: CGRect( x: 0, y: 0, width: diceWidthSize, height: diceWidthSize))
        ui.setBackgroundImage(Setting.diceArray[5], for: UIControl.State.normal)
        ui.addTarget(self, action: #selector(dicePressed),  for: .touchUpInside)
        return  ui
    }
    
    @objc func dicePressed(_ sender: UIButton) {
        let steps: Int =  dice.roll()
        let startPosition: Int = players[currentIndex].position
        
        // change dice background image on move
        sender.setBackgroundImage(Setting.diceArray[steps - 1], for: UIControl.State.normal)
        sender.isEnabled = false
        
        // move current player position
        let debuggingMsg = "\(players[currentIndex].name) get \(steps) steps from  \(players[currentIndex].position)"
        print(debuggingMsg)
        var endPosition: Int = players[currentIndex].position + steps
        
        let animator = createMoveAnimator(playerButtons[currentIndex], to: startPosition + 1)
        var preAnimarot = animator
        if steps >= 2 {
            for i in 2...steps {
                let currentAnimator = createMoveAnimator(playerButtons[currentIndex], to: startPosition + i)
                preAnimarot.addCompletion{_ in currentAnimator.startAnimation()}
                preAnimarot = currentAnimator
                //            moveOnBoard(playerButtons[currentIndex], to: start + i)
            }
        }
        
        
        // continue move on the map of board
        while true {
            if let unwrapped = map[endPosition] {
//                moveOnBoard(playerButtons[currentIndex], to: end)
                endPosition = unwrapped
                let animator = createMoveAnimator(playerButtons[currentIndex], to: endPosition)
                preAnimarot.addCompletion{_ in animator.startAnimation()}
                preAnimarot.addCompletion{_ in sender.isEnabled = true}
            }else {
                preAnimarot.addCompletion{_ in sender.isEnabled = true}
                break
            }
        }
        
        animator.startAnimation()
        // move the icon of the current player on board
        players[currentIndex].moveTo(endPosition)
        //        moveOnBoard(playerButtons[currentIndex], to: players[currentIndex].position)
        playerButtons[currentIndex].backgroundColor = UIColor.clear
        
        // prepare for the next player
        if players[currentIndex].isWin {
            sender.isEnabled = false
            print("\(players[currentIndex].name) position:  \(players[currentIndex].position)")
        }else {
            currentIndex += 1
            currentIndex = currentIndex % Setting.numberOfPlayer
            playerButtons[currentIndex].backgroundColor = .black
        }
    }
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupBoardPad()
        
    }
    
    private func setupBoardPad() {
        for button in playerButtons {
            holder.addSubview(button)
        }
        for i in 0..<Setting.numberOfPlayer {
            players[i].position = Setting.startPosition
        }
        diceContainer.addSubview(diceButton)
    }
    
    func computerXY(from position: Int) -> (x: Int, y: Int) {
        let x = ((position - 1) / 10 % 2 == 0) ? (position - 1) % 10 : 9 - (position - 1) % 10
        let y = 9 - (position - 1) / 10
        return (x: x, y: y)
    }
    
    func createMoveAnimator(_ button: UIButton, to end: Int ) ->  UIViewPropertyAnimator{
        
//        let endX = ((end - 1) / 10 % 2 == 0) ? (end - 1) % 10 : 9 - (end - 1) % 10
//        let endY = 9 - (end - 1) / 10
        let (endX, endY) = computerXY(from: end)
        
        let animator: UIViewPropertyAnimator = UIViewPropertyAnimator(
            duration: 10.0 / Double(Setting.gameSpeed),
            curve: .linear,
            animations: {[self] in
                button.frame = CGRectMake(self.cellSize * Double(endX), self.cellSize * Double(endY), self.cellSize, self.cellSize ) }
        )
        
        return animator
    }
    
    
    
    private func createPlayerButton(n: Int, type: Int, name: String) -> UIButton {
        let image = Setting.palyerImages[type]
        let (x, y) = computerXY(from: n)
        let button = UIButton(
            frame: CGRect(
                x: cellSize * Double(x),
                y: cellSize * Double(y),
                width: cellSize,
                height: cellSize))
        button.setTitle(name, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setBackgroundImage(image, for: UIControl.State.normal)
        
        return  button
    }
    
}


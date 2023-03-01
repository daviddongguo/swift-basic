//
//  MiniDiceGame.swift
//  CommandLineProject
//
//  Created by map07 on 2023-03-01.
//

class MiniDiceGame: DiceGame {
    func dicideOrder1(){
        var i = 2
        for player in self.players {
            player.totalScore = i
//            i += 1
        }
        players = players.sorted(by: {(a, b) in a.totalScore > b.totalScore} )
    }
    
    func dicideOrder(finaList: inout [Player], listToDecide: [Player]) -> Void {
        if listToDecide.count == 1 {
            finaList.append(listToDecide[0])
        }
        
        let map = initializeMap(listToDecide)
        for (key, value) in map {
            print(key)
            for player in value {
                print(player.name, player.totalScore)
            }
        }
    }
    
    private func initializeMap(_ list: [Player]) -> [Int : [Player]] {
        var map: [Int : [Player]] = [:]
        for player in list {
            if var array = map[player.totalScore] {
                array.append(player)
            }else{
                map[player.totalScore] = [player]
            }
        }
        return map
    }
    
}

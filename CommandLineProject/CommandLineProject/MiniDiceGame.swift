//
//  MiniDiceGame.swift
//  CommandLineProject
//
//  Created by map07 on 2023-03-01.
//
import Foundation

class MiniDiceGame: DiceGame {
    func dicideOrder1(){
        for player in self.players {
            player.totalScore = 2
        }
        players = players.sorted(by: {(a, b) in a.totalScore > b.totalScore} )
    }
    
    func dicideOrder(finaList: inout [Player], listToDecide: [Player]) -> Void {
        if listToDecide.count == 1 {
            finaList.append(listToDecide[0])
        }
        
        let map = initializeMap(listToDecide)
        
        for i in Swift.stride(from: 6, to: 0, by: -1) {
            
            guard let players = map[i] else {
                continue
            }
            if players.count == 1 {
                finaList.append(players[0])
                continue
            }
            if players.count >= 2 {
                print("start to dice")
                players.forEach{(player) in print(player.name)}
                for player in players {
                    player.totalScore = dice.earnScore()
                    print(player.name, player.totalScore)
                }
                dicideOrder(finaList: &finaList, listToDecide: players)
            }
            
        }
        
        
        
        
        
    }
    
    private func initializeMap(_ list: [Player]) -> [Int : [Player]] {
        var map: [Int : [Player]] = [:]
        for player in list {
            if var players = map[player.totalScore] {
                players.append(player)
                map[player.totalScore] = players
            }else{
                map[player.totalScore] = [player]
            }
        }
        return map
    }
    
}

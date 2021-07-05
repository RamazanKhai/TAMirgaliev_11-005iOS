import UIKit

var countOfCommands : Int = 8
var countPeopleInCommand : Int = 5

struct SimplePlayer {
    var hp : Int
    var damage : Int
    var isAlive : Bool = true
}

class Command {
    var name: String
    var allPlayers = [SimplePlayer]()
    var weapon: Int = 0
    var heal: Int = 0
    
    init(name : String) {
        self.name = name
    }
    
    
    func isAlive() -> Bool { // проверка остался ли уто-то живой в команде
        if countOfAlivePersons() < 1 {
            return false
        } else {
            return true
        }
    }
    
    func countOfAlivePersons() -> Int {
        var countOfAlive = 0
        
        for i in 0..<allPlayers.count {
            if allPlayers[i].isAlive {
                countOfAlive += 1
            }
        }
        return countOfAlive
    }
    
    func minusHp(hp: Int){
        for i in 0..<allPlayers.count {
            if allPlayers[i].hp-hp<1 {
                allPlayers[i].isAlive = false
                allPlayers[i].hp = 0
            } else {
                allPlayers[i].hp = allPlayers[i].hp - hp
           }
        }
    }
    
    func powerOfTeam() -> Int {
        var power : Int = weapon
       
        for player in allPlayers {
            power += player.damage
        }
        return power
    }
    
    

}

var allCommands = [Command]()

class Game{

    func createACommads() -> Void{ // заполнение команд играками
        for i in 0..<countOfCommands {
            allCommands.append(Command.init(name: "Command \(i + 1)"))
            for _ in 0..<countPeopleInCommand {
                allCommands[i].allPlayers.append(SimplePlayer.init(hp: Int.random(in: 1...10), damage: Int.random(in: 1...5)))
            }
        }
    }
    
    func findLoot(){
        print("\nFinding loot... xxxx")
        for command in allCommands {
            let random = Int.random(in: 0...10)
            let newWeapon = Int.random(in: 1...3)
            if (random > 7 && newWeapon > command.weapon) {
                command.weapon = newWeapon
                print("\(command.name) find weapon damage \(newWeapon)")
            }else if (random > 3){
                command.heal = Int.random(in: 1...3)
                print("\(command.name) find heal \(command.heal)")
            }else { print("\(command.name) found nothing\n") }
        }
    }
    
    func heal(){
        for comandIndex in 0..<allCommands.count {
            for j in 0..<allCommands[comandIndex].allPlayers.count {
                if (allCommands[comandIndex].allPlayers[j].hp + allCommands[comandIndex].heal > 10 ){
                    allCommands[comandIndex].allPlayers[j].hp = 10
                } else {
                    allCommands[comandIndex].allPlayers[j].hp += allCommands[comandIndex].heal
                }
            }
            allCommands[comandIndex].heal = 0
        }
        
    }
    
    
    func round(){
        print("Figting")
        print()
        var newCommands = [Command]()
        for i in 0..<allCommands.count/2  {
            print("\(allCommands[i].name) \(allCommands[allCommands.count - i - 1].name) figting ")
            if (allCommands[i].powerOfTeam() >= allCommands[allCommands.count - i - 1].powerOfTeam()){
                allCommands[i].minusHp(hp: allCommands[allCommands.count - i - 1].powerOfTeam()/allCommands[allCommands.count - i - 1].countOfAlivePersons())
                newCommands.append(allCommands[i])
                print("\(allCommands[i].name) is win")
            }else{
                allCommands[allCommands.count - i - 1].minusHp(hp:allCommands[i].powerOfTeam()/allCommands[i].countOfAlivePersons())
                newCommands.append(allCommands[allCommands.count - i - 1])
                print("\(allCommands[allCommands.count - i - 1].name) is win")
            }
        }
        allCommands = newCommands
        
        if allCommands.count > 1 {
            findLoot()
            return round()
        }
    }
}

var game = Game()
game.createACommads()
game.round()


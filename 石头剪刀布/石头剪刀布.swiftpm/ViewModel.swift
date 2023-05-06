import SwiftUI


class ViewModel: ObservableObject{
    
    var rPSs:Array<rockPaperScissors<String>.RockPaperScissor>{
        return model.RPSs
    }
    
    var computerRPSs:Array<rockPaperScissors<String>.RockPaperScissor>{
        return model.ComputerRPSs
    }
    
    @Published var model: rockPaperScissors<String> = ViewModel.createRPS()
    var computerIndex:Int=0
    var myIndex:Int=0
    
    static func createRPS() -> rockPaperScissors<String>{
        let chosenHands: Array<String> = hands()
        func createRPS(index: Int) -> String{
            return chosenHands[index]
        }
        return rockPaperScissors<String>(IdOfRPS: createRPS,InOfComputerRPS: createRPS)
    }
    
    func choose(){
        model.choose(RPS: rPSs[myIndex])
    }
    
    func change(){
        model.change(RPS: rPSs[myIndex])
    }
    
    func computerChoose(){
        model.computerChoose(computerRPS: computerRPSs[computerIndex], RPS: rPSs[myIndex])
    }
    
    func compare(hand:rockPaperScissors<String>.RockPaperScissor,computerHand:rockPaperScissors<String>.RockPaperScissor)->String{
        let statements: Array<String>=["Tied!","You win!","You lose!"]
        let IndexOfStatementNum:Int=model.compare(RPS: hand, computerRPS: computerHand)
        print(statements[IndexOfStatementNum])
        return statements[IndexOfStatementNum]
    }
}

func hands()->Array<String>{
    return ["✂️","🪨","🏳️"]
}

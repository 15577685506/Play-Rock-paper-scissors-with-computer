import Foundation


struct rockPaperScissors<RockPaperScissorContent>{
    var RPSs: Array<RockPaperScissor>
    var ComputerRPSs: Array<RockPaperScissor>
    
    struct RockPaperScissor: Identifiable{
        var RockPaperScissors: RockPaperScissorContent
        var isChosen: Bool
        var id: Int
    }
    
    mutating func choose(RPS: RockPaperScissor) {
        print("your choice:\(RPS)")
        let indexOfMyChoice:Int=index(of: RPS)
        self.RPSs[indexOfMyChoice].isChosen = true
    }
    
    mutating func change(RPS:RockPaperScissor){
        let idexOfChoice:Int=index(of:  RPS)
        self.RPSs[idexOfChoice].isChosen = !self.RPSs[idexOfChoice].isChosen
    }
    
    mutating func computerChoose(computerRPS:RockPaperScissor,RPS:RockPaperScissor) {
        print("computer's choice:\(computerRPS)")
        print("")
        if RPS.isChosen==true{
            let indexOfComputerChoice:Int=index(of: computerRPS)
            self.ComputerRPSs[indexOfComputerChoice].isChosen = true
        }
    }
    
    mutating func compare(RPS:RockPaperScissor,computerRPS:RockPaperScissor)->Int{
        var indexOfStatement:Int
        let chosenIndexOfRPS: Int = self.index(of: RPS)
        let choenIndexOfComputerRPS:Int = self.index(of: computerRPS)
        
        if self.RPSs[chosenIndexOfRPS].id == self.RPSs[choenIndexOfComputerRPS].id{
            indexOfStatement = 0
        }else if (self.RPSs[chosenIndexOfRPS].id==0&&self.RPSs[choenIndexOfComputerRPS].id==2)||(self.RPSs[chosenIndexOfRPS].id-1==self.RPSs[choenIndexOfComputerRPS].id){
            indexOfStatement = 1
        }else{
            indexOfStatement = 2
        }
        return indexOfStatement
    }
    
    func index (of rockPaperScissor: RockPaperScissor) -> Int {
        for index in 0..<self.RPSs.count {
            if self.RPSs[index].id == rockPaperScissor.id {
                return index
            }
        }
        return 0
    }
    
    init (IdOfRPS: (Int) ->RockPaperScissorContent,InOfComputerRPS:(Int)->RockPaperScissorContent){
        let numOfRPS: Int = 3
        RPSs = Array<RockPaperScissor>()
        ComputerRPSs=Array<RockPaperScissor>()
        for index in 0..<numOfRPS{
            let content = IdOfRPS(index)
            RPSs.append(RockPaperScissor( RockPaperScissors:  content, isChosen: false, id: index))
            ComputerRPSs.append(RockPaperScissor( RockPaperScissors:  content, isChosen: false, id: index))
        }
    }
}

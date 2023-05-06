import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 15).fill(Color(red: 0.4627, green: 0.8392, blue: 1.0))
            
            VStack(spacing: 50){
                Text("")
                
                Text("")
                
                Text("石头剪刀布")
                    .font(Font.system(size: 30))
                    .foregroundStyle(.linearGradient(colors: [.red,.orange], startPoint: .top, endPoint: .bottom))
                
                VStack(spacing:15){
                    HStack{
                        choiceView(viewModel: viewModel, hand:viewModel.rPSs[viewModel.myIndex], computerHand: viewModel.computerRPSs[viewModel.computerIndex])
                            .font(Font.system(size: 80.0))
                        
                    }
                    
                }
                .padding()
                /*ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 400,height: 100)
                        .foregroundColor(Color.yellow)*/
                    
                    VStack{
                        //Text("Result:")
                        
                        result(viewModel: viewModel, myResult: viewModel.rPSs[viewModel.myIndex], computerResult: viewModel.computerRPSs[viewModel.computerIndex])
                        
                    }
                    .font(Font.system(size: 60)).foregroundStyle(.linearGradient(colors: [.red,.orange], startPoint: .top, endPoint: .bottom))
                //}
                
                HStack{
                    Text("  ")
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.yellow)
                            .frame(width: 400,height: 180)
                        
                        VStack{
                            Text(" Please Make Your Decision").font(Font.system(size: 18)).foregroundColor(.blue)
                            
                            HStack{
                                ForEach(0..<3){index in
                                    optionsView(hand: viewModel.rPSs[Int(index)]).onTapGesture { 
                                        withAnimation(.easeInOut(duration: 0.4)){
                                            viewModel.computerIndex=Int(arc4random_uniform(3))
                                            viewModel.myIndex=Int(index)
                                            self.viewModel.choose()
                                            self.viewModel.computerChoose()
                                            
                                        }
                                        print("")
                                        
                                        print(" ")
                                    }
                                    .font(Font.system(size: 80.0))
                                }
                            }
                            .padding()
                        }
                    }
                    Text("  ")
                }
                Text("")
                Text("")
            }
        }
    }
    struct optionsView: View{
        var hand:rockPaperScissors<String>.RockPaperScissor
        var body: some View{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 100,height: 100)
                    .foregroundColor(Color.orange)
                Text(hand.RockPaperScissors)
            }
            
        }
    }
    
}


struct myChoiceView:View{
    var chosenHand:rockPaperScissors<String>.RockPaperScissor
    var body: some View{
        VStack{
            Text("Your Chioce").font(Font.system(size: 15)).foregroundColor(Color.blue)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 100,height: 100)
                    .foregroundColor(Color.orange)
                if chosenHand.isChosen{
                    Text(chosenHand.RockPaperScissors)
                }else{
                    Text(" ")
                }
            }
        }
    }
}

struct computerChoiceView: View{
    var chosenHand:rockPaperScissors<String>.RockPaperScissor
    var body: some View{
        VStack{
            Text("Compter's Choice").font(Font.system(size: 15)).foregroundColor(Color.blue)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 100,height: 100)
                    .foregroundColor(Color.orange)
                if chosenHand.isChosen{
                    Text(chosenHand.RockPaperScissors)
                }else{
                    Text("  ")
                }
            }
        }
    }
}
    
struct choiceView: View{
    var viewModel:ViewModel
    var hand:rockPaperScissors<String>.RockPaperScissor
    var computerHand:rockPaperScissors<String>.RockPaperScissor
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 400, height: 150)
                .foregroundColor(Color.yellow)
            HStack{
                myChoiceView(chosenHand: viewModel.rPSs[viewModel.myIndex]).font(Font.system(size: 80.0))
                Text(" ")
                computerChoiceView(chosenHand: computerHand)
            }
        }
    }
}

struct result: View{
    var viewModel:ViewModel
    var myResult:rockPaperScissors<String>.RockPaperScissor
    var computerResult:rockPaperScissors<String>.RockPaperScissor
    var body: some View {
        if myResult.isChosen{
            Text(viewModel.compare(hand: myResult, computerHand: computerResult))
        }else{
            Text(" ")
        }
    }
}

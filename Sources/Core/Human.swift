public class Human: Player {
    public let marker: String
    let io: IO
    
    public init(marker: String, io: IO){
        self.marker = marker
        self.io = io
    }
    
    public func getMove(avaliableMoves: [Int]) -> Int{
        let message = "Select a Move:"
        while true {
            io.output(message: message)
            if let input = io.input(), x = Int(input){
                if avaliableMoves.contains(x){
                    return x
                }
            }
            io.output(message: "Invalid Input Please Try Again")
        }
    }
    
}
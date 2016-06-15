public class Human: Player{
    let marker: String
    let ui: UI
    public init(marker: String, ui: UI){
        self.marker = marker
        self.ui = ui
    }
    func getMove(avaliableMoves: [Int]) -> Int{
        var move = 0
        func isValidMove(input:String?) -> Bool{
            if (input == nil){
                return false
            }
            if (Int(input!) == nil){
                return false
            }
            move = Int(input!)!
            return avaliableMoves.contains(move)
        }
        ui.getInput(userPrompt:"where do you want to move?", validationCheckFunction: isValidMove)
        return move
    }
    func getMarker() -> String{
        return marker
    }
}
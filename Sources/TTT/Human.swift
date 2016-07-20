public class Human: Player {
    public let marker: String
    let ui: UI
    
    public init(marker: String, ui: UI){
        self.marker = marker
        self.ui = ui
    }
    
    public func getMove(board: Board) -> Int{

        func isValidMove(input: String) -> Bool{
            if let x = Int(input){
                return board.getAvaliablePositions().contains(x)
            }else{
                return false
            }
        }

        ui.promptSelectMove();
        return Int(ui.getInput(isValidFunction: isValidMove))!
    }
}
public class Human: Player {
    public let marker: String
    let ui: UI
    
    public init(marker: String, ui: UI){
        self.marker = marker
        self.ui = ui
    }
    
    public func getMove(board: Board) -> Int{
        ui.promptSelectMove();
        return Int(ui.getInput(){
            if let x = Int($0){
                return board.getAvaliablePositions().contains(x)
            }else{
                return false
            }
        })!
    }
}
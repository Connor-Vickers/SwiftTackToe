public class Human: Player {
    public let marker: String
    let ui: UI
    
    public init(marker: String, ui: UI){
        self.marker = marker
        self.ui = ui
    }
    
    public func getMove(board: Board) -> Int{
        ui.promptSelectMove();
        return ui.getInput(validInputs: board.getAvaliablePositions())
    }
}
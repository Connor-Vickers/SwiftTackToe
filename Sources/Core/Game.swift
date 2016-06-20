public class Game {
    let board: Board
    
    public init(board: Board){
        self.board = board
    }
    
    public func isWin() -> Bool {
        var winPossibilities = [[String]]()
        
        let diagonals = board.getDiagonals()
        winPossibilities.append(diagonals.forwardDiagonal)
        winPossibilities.append(diagonals.backwardDiagonal)
        
        winPossibilities += board.getRows()
        winPossibilities += board.getColumns()
        
        //search all winPossibilities for win
        for possibility in winPossibilities {
            var win = true
            let marker = possibility[0]
            for position in possibility {
                if position != marker {
                    win = false
                }
            }
            if win {
                return true
            }
        }
        return false
    }
    
    
    
    public func isTie() -> Bool{
        return !isWin() && board.getAvaliablePositions().count == 0
        
    }
    
}

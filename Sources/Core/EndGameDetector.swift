public class EndGameDetector {
    
    public static func isWin(board: Board) -> Bool {
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
    
    
    
    public static func isTie(board: Board) -> Bool{
        return !isWin(board: board) && board.getAvaliablePositions().count == 0
        
    }
    
}

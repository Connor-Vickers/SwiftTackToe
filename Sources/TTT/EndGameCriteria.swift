public protocol EndGameCriteria {
    func isWin(board: Board) -> Bool
    func isTie(board: Board) -> Bool
}

public class StandardTTT : EndGameCriteria{

    public init() {}
    
    public func isWin(board: Board) -> Bool {
        let winPossibilities = getAllPossibilitys(board: board);
        return winPossibilities.contains(possibilityIsWin)
    }
    
    func possibilityIsWin(possibility :[String]) -> Bool{
        let marker = possibility[0]
        for position in possibility {
            if position != marker {
                return false
            }
        }
        return true
    }
    
    func getAllPossibilitys(board: Board) -> [[String]]{
        var possibilities = [[String]]()
        let diagonals = board.getDiagonals()
        possibilities.append(diagonals.forwardDiagonal)
        possibilities.append(diagonals.backwardDiagonal)
        possibilities+=board.getRows()
        possibilities+=board.getColumns()
        return possibilities
        
    }

    public func isTie(board: Board) -> Bool{
        return !isWin(board: board) && board.getAvaliablePositions().count == 0
        
    }
    
}

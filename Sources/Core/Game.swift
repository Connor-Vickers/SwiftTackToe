public protocol Game {
    init(board: Board)
    func isWin() -> Bool
    func isTie() -> Bool
}

public class StandardTTT : Game{
    let board: Board
    
    public required init(board: Board){
        self.board = board
    }
    
    public func isWin() -> Bool {
        let winPossibilities = getAllPossibilitys();
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
    
    func getAllPossibilitys() -> [[String]]{
        var possibilities = [[String]]()
        let diagonals = board.getDiagonals()
        possibilities.append(diagonals.forwardDiagonal)
        possibilities.append(diagonals.backwardDiagonal)
        possibilities+=board.getRows()
        possibilities+=board.getColumns()
        return possibilities
        
    }

    public func isTie() -> Bool{
        return !isWin() && board.getAvaliablePositions().count == 0
        
    }
    
}

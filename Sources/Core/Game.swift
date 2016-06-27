public protocol Game {
    init(board: Board)
    isWin() -> Bool
    isTie() -> Bool
}

public class StandardTTT {
    let board: Board
    
    public init(board: Board){
        self.board = board
    }
    
    public func isWin() -> Bool {
        let winPossibilities = getAllPossibilitys();
        return winPossibilities.contains(possibilityIsWin)
    //look at map and reduce
    //kata monday
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
        possibilities.append(board.getRows())
        possibilities.append(board.getColumns())
        return possibilities
        
    }

    public func isTie() -> Bool{
        return !isWin() && board.getAvaliablePositions().count == 0
        
    }
    
}

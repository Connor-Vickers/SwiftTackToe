public class Board {
    let size: Int
    var markers: [String]
    var moves: [Int]
    var move: Int
    
    public init(size: Int = 3){
        self.size = size
        markers = [String]()
        for position in 1...(size*size) {
            markers.append(String(position))
        }
        moves = [Int]()
        move = 0
    }
    public func getSize()-> Int{
        return size
    }
    public func move(position: Int, marker: String){
        markers[position] = marker
        moves.append(position)
        move += 1
    }
    public func getMarkerAtPosition(position: Int) -> String{
        return markers[position]
    }
    public func isWin() -> Bool {
        var winPossibilities = [[String]]()

        let diagonals = getDiagonals()
        winPossibilities.append(diagonals.forwardDiagonal)
        winPossibilities.append(diagonals.backwardDiagonal)
        
        winPossibilities += getRows()
        winPossibilities += getColumns()
        
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
    
    func getDiagonals() -> (forwardDiagonal: [String], backwardDiagonal: [String]){
        var forwardDiagonal = [String]()
        var backwardDiagonal = [String]()
        for i in 0..<size {
            backwardDiagonal.append(markers[i*size+i])
            forwardDiagonal.append(markers[i*size+(size-i-1)])
        }
        return (forwardDiagonal, backwardDiagonal)
    }
    
    func getRows() -> [[String]] {
        var rows = [[String]]()
        for rowNumber in 0..<size {
            var row = [String]()
            for column in 0..<size {
                row.append(markers[rowNumber*size+column])
            }
            rows.append(row)
        }
        return rows
    }
    
    func getColumns() -> [[String]] {
        var columns = [[String]]()
        for columnNumber in 0..<size {
            var column = [String]()
            for row in 0..<size {
                column.append(markers[row*size+columnNumber])
            }
            columns.append(column)
        }
        return columns
    }
}

public struct Board {
    let size: Int
    var markers: [String]
    var moves: [Int]
    
    public init(size: Int = 3){
        self.size = size
        markers = [String]()
        for position in 0..<(size*size) {
            markers.append(String(position))
        }
        moves = [Int]()
    }
    
    public func getSize()-> Int{
        return size
    }
    public mutating func move(position: Int, marker: String){
        markers[position] = marker
        moves.append(position)
    }
    public func getMarkerAtPosition(position: Int) -> String{
        return markers[position]
    }
    public func getAvaliablePositions() -> [Int] {
        var avaliablePositions = [Int]()
        for position in 0..<size*size {
            if (markers[position] == String(position)) {
                avaliablePositions.append(position)
            }
        }
        return avaliablePositions
    }
    
    public func getDiagonals() -> (forwardDiagonal: [String], backwardDiagonal: [String]){
        var forwardDiagonal = [String]()
        var backwardDiagonal = [String]()
        for i in 0..<size {
            backwardDiagonal.append(markers[i*size+i])
            forwardDiagonal.append(markers[i*size+(size-i-1)])
        }
        return (forwardDiagonal, backwardDiagonal)
    }
    
    public func getRows() -> [[String]] {
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
    
    public func getColumns() -> [[String]] {
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
    

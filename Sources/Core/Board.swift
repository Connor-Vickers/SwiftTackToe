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
    public func getPosition(position: Int) -> String{
        return markers[position]
    }
}

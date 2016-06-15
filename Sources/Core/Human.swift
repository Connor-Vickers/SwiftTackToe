public class Human: Player{
    let marker: String
    public init(marker: String){
        self.marker = marker
    }
    public func getMove(avaliableMoves: [Int]) -> Int{
        return avaliableMoves[0]
    }
    func getMarker() -> String{
        return marker
    }
}
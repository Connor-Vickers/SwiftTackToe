import TTT

public class PlayerMock: Player{
	public let marker: String
    
    public init(marker: String){
        self.marker = marker
    }
    
    public func getMove(avaliableMoves: [Int]) -> Int{
        return avaliableMoves[0]
    }
}
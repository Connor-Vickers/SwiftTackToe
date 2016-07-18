public class SmartCPU: Player{
	public let marker: String
	public init(marker: String){
		self.marker = marker
	}
	public func getMove(board: Board) -> Int{
		if board.getAvaliablePositions().contains(0){
			return 0
		}else{
			return 4
		}
	}
}
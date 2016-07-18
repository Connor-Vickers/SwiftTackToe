public class SmartCPU: Player{
	public let marker: String
	let endGameCriteria: EndGameCriteria
	let opponateMarker: String

	public init(marker: String, opponateMarker: String){
		self.marker = marker
		endGameCriteria = StandardTTT()
		self.opponateMarker = opponateMarker
	}
	public func getMove(board: Board) -> Int{

		var blockingMove: Int? = nil
		
		for position in board.getAvaliablePositions(){
			var tempBoard = board
			tempBoard.move(position: position, marker: marker)
			if endGameCriteria.isWin(board: tempBoard){
				return position
			}
			tempBoard = board
			tempBoard.move(position: position, marker: opponateMarker)
			if endGameCriteria.isWin(board: tempBoard){
				blockingMove = position
			}
		}
		return blockingMove ?? board.getAvaliablePositions()[0]
	}
}
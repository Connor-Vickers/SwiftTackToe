public class SmartCPU: Player{
	public let marker: String
	let endGameCriteria: EndGameCriteria
	let opponentMarker: String

	public init(marker: String, opponentMarker: String){
		self.marker = marker
		endGameCriteria = StandardTTT()
		self.opponentMarker = opponentMarker
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
			tempBoard.move(position: position, marker: opponentMarker)
			if endGameCriteria.isWin(board: tempBoard){
				blockingMove = position
			}
		}
		return blockingMove ?? board.getAvaliablePositions()[0]
	}
}
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
		var possibleMoves: [[Int]] = []	
		for position in board.getAvaliablePositions(){
			let score = evalMove(board: board, move: position, marker: marker)
			let possibleMove = [position, score]
			possibleMoves.append(possibleMove)
		}
		let bestMove = possibleMoves.reduce([-1,-2]){ previousBestMove, move in
			return (move[1] > previousBestMove[1]) ? move : previousBestMove
		}
		return bestMove[0]
	}

	func evalMove(board: Board, move: Int, marker: String) -> Int{
		var newBoard = board
		newBoard.move(position: move, marker: marker)
		if endGameCriteria.isWin(board: newBoard){
			return 1
		}else if endGameCriteria.isOnGoing(board: newBoard) || endGameCriteria.isTie(board: newBoard){
			return 0
		}else{
			return -1//is loss
		}
	}
}
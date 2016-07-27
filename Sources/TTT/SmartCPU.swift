public class SmartCPU: Player{
	public let marker: String
	let gameCriteria: GameCriteria
	let opponentMarker: String

	public init(marker: String, opponentMarker: String){
		self.marker = marker
		gameCriteria = StandardTTT()
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
		if gameCriteria.isWin(board: newBoard){
			return 1
		}else if gameCriteria.isOnGoing(board: newBoard) || gameCriteria.isTie(board: newBoard){
			return 0
		}else{
			return -1//is loss
		}
	}
}
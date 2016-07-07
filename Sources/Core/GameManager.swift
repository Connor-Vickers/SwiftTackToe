public class GameManager{

	// Process.arguments => [String]

	let ui: UI
	var currentPlayer: Player
	var board: Board
	let player1: Player
	let player2: Player
	let endGameCriteria: EndGameCriteria

	public init(player1: Player, player2: Player, board: Board, endGameCriteria: EndGameCriteria, ui: UI){
		self.player1 = player1
		self.player2 = player2
		self.board = board
		self.ui = ui
		self.endGameCriteria = endGameCriteria
		currentPlayer = player1
	}
	public func start(){
		gameLoop()
		outputResultsOfGame()
	}

	func gameLoop(){
		while gameIsOngoing() {
			ui.displayBoard(board: board)
			ui.promptTurn(player: currentPlayer)
			board.move(position: currentPlayer.getMove(avaliableMoves: board.getAvaliablePositions()), marker: currentPlayer.marker)
			swapPlayers()
		}
	}

	func outputResultsOfGame(){
		ui.displayBoard(board: board)
		if endGameCriteria.isWin(board: board){
			swapPlayers()
			ui.promptWon(player: currentPlayer)
		}else{
			ui.promptTie()
		}
	}

	func swapPlayers(){
		if(currentPlayer.marker == player1.marker){
			currentPlayer = player2
		}else{
			currentPlayer = player1
		}
	}

	func gameIsOngoing() -> Bool {
		let gameOver = endGameCriteria.isWin(board: board) || endGameCriteria.isTie(board: board)
		return !gameOver
	}
}
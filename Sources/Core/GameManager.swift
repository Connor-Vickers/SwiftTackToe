public class GameManager{
	let ui: UI
	var game: Game
	var currentPlayer: Player
	var board: Board
	let player1: Player
	let player2: Player

	public init(player1: Player, player2: Player, board: Board, game: Game, ui: UI){
		self.player1 = player1
		self.player2 = player2
		self.board = board
		self.game = game
		self.ui = ui
		currentPlayer = player1
	}
	public func start(){
		//pick markers
		//pick player types
		//pick who goes first

		gameLoop()
		outputResultsOfGame()

		//want to play again?
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
		if game.isWin(){
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
		let gameOver = game.isWin() || game.isTie()
		return !gameOver
	}
}
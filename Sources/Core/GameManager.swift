public class GameManager{
	let io :IO
	var game: Game
	var currentPlayer: Player
	var board: Board
	let player1: Player
	let player2: Player

	public init(player1: Player, player2: Player, io: IO, board: Board, game: Game){
		self.player1 = player1
		self.player2 = player2
		self.io = io
		self.board = board
		self.game = game
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
			UI.displayBoard(board: board, io: io)
			io.output(message: "\(currentPlayer.marker)'s turn\n")
			board.move(position: currentPlayer.getMove(avaliableMoves: board.getAvaliablePositions()), marker: currentPlayer.marker)
			swapPlayers()
		}
	}

	func outputResultsOfGame(){
		UI.displayBoard(board: board, io: io)
		if game.isWin(){
			swapPlayers()
			io.output(message: "\(currentPlayer.marker) won!\n")
		}else{
			io.output(message: "Game was a Tie")
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
public class GameManager{

	// Process.arguments => [String]

	let ui: UI
	var currentPlayer: Player
	var board: Board
	let player1: Player
	let player2: Player
	let gameCriteria: GameCriteria

	public init(options: Options, gameCriteria: GameCriteria, ui: UI){
		self.player1 = GameManager.instantiatePlayer(playerOption: options.firstPlayer, ui: ui)
		self.player2 = GameManager.instantiatePlayer(playerOption: options.secondPlayer, ui: ui)
		self.board = Board(size: options.size)
		self.ui = ui
		self.gameCriteria = gameCriteria
		currentPlayer = player1
	}

	private static func instantiatePlayer(playerOption: Options.PlayerOption, ui: UI) -> Player{
		switch(playerOption){
			case let Options.PlayerOption.Human(marker):
				return Human(marker: marker, ui: ui)
			//case let Options.PlayerOption.Computer(marker):
			//	return Computer(marker: marker)
			default:
				assert(false, "recieved invalid player option \(playerOption)")
		}


	}

	public func start(){
		gameLoop()
		outputResultsOfGame()
	}

	func gameLoop(){
		while gameCriteria.isOnGoing(board: board) {
			ui.displayBoard(board: board)
			ui.promptTurn(player: currentPlayer)
			board.move(position: currentPlayer.getMove(board: board), marker: currentPlayer.marker)
			swapPlayers()
		}
	}

	func outputResultsOfGame(){
		ui.displayBoard(board: board)
		if gameCriteria.isWin(board: board){
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


}
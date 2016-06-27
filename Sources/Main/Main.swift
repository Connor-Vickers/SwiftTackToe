import Core

let io :IO = CommandLine()
let player1 :Player = Human(marker: "X", io: io)
let player2 :Player = Human(marker: "O", io: io)
let board = Board()
let game = Game(board: board)
var currentPlayer = player1
let gameManager = GameManager(player1: player1, player2: player2, game: Game, io: io)

gameManager.start()

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

while gameIsOngoing() {
	UI.displayBoard(board: board, io: io)
	io.output(message: "Player \(currentPlayer.marker)'s turn\n")
	board.move(position: currentPlayer.getMove(avaliableMoves: board.getAvaliablePositions()), marker: currentPlayer.marker)
	swapPlayers()
}

UI.displayBoard(board: board, io: io)
if game.isWin(){
	swapPlayers()
	io.output(message: "Player \(currentPlayer.marker) won!\n")
}else{
	io.output(message: "Game was a Tie")

}

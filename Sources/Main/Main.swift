import Core

let io :IO = CommandLine()
let player1 :Player = Human(marker: "X", io: io)
let player2 :Player = Human(marker: "O", io: io)
let board = Board()		
let game = StandardTTT(board: board)
let gameManager = GameManager(player1: player1, player2: player2, io: io, board: board, game: game)

gameManager.start()


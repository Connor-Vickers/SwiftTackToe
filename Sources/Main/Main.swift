import Core

let io :IO = CommandLine()
let ui = UI(io: io)
let player1 :Player = Human(marker: "X", ui: ui)
let player2 :Player = Human(marker: "O", ui: ui)
let board = Board()		
let game = StandardTTT(board: board)
let gameManager = GameManager(player1: player1, player2: player2, board: board, game: game, ui: ui)

gameManager.start()


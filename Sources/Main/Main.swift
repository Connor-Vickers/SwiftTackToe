import Core

let io :IO = CommandLine()
let ui = UI(io: io)
let player1 :Player = Human(marker: "X", ui: ui)
let player2 :Player = Human(marker: "O", ui: ui)
let board = Board()		
let endGameCriteria = StandardTTT()
let gameManager = GameManager(player1: player1, player2: player2, board: board, endGameCriteria: endGameCriteria, ui: ui)

gameManager.start()
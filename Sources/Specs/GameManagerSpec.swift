import Speck
import Core

let GameManagerSpec = describe("game manager"){
  var board: Board = Board();
  var game: Game = StandardTTT(board: board)
  var player1: Player = PlayerMock(marker: "X")
  var player2: Player = PlayerMock(marker: "O")
  var io: TestIO = TestIO(inputs:[])
  var ui: UI = UI(io: io)
  var gameManager: GameManager = GameManager(player1: player1, player2: player2, board: board, game: game, ui: ui)

  before {
    board = Board();
    game = StandardTTT(board: board)
    player1 = PlayerMock(marker: "X")
    player2 = PlayerMock(marker: "O")
    io = TestIO(inputs:[])
    ui = UI(io: io)
    gameManager = GameManager(player1: player1, player2: player2, board: board, game: game, ui: ui)

  }

  it("recongnizes a tie") {
    board.move(position: 0, marker: "X")
    board.move(position: 1, marker: "O")
    board.move(position: 2, marker: "X")
    board.move(position: 3, marker: "X")
    board.move(position: 4, marker: "O")
    board.move(position: 5, marker: "X")
    board.move(position: 6, marker: "O")
    board.move(position: 7, marker: "X")
    board.move(position: 8, marker: "O")
    gameManager.start()
    expect(io.getOutputAsASingleString()).to(equal: "\nX|O|X\n_____\nX|O|X\n_____\nO|X|O\nGame was a Tie")
  }

  it("recongnizes a row win") {
    board.move(position: 0, marker: "O")
    board.move(position: 1, marker: "O")
    board.move(position: 2, marker: "O")
    gameManager.start()
    expect(io.getOutputAsASingleString()).to(equal: "\nO|O|O\n_____\n3|4|5\n_____\n6|7|8\nO Won!\n")
  }
}
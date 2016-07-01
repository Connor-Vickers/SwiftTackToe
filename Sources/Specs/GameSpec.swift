import Speck
import Core

let GameSpec = describe("game") {
    var board: Board = Board();
    var game: Game = StandardTTT(board: board)

    func before() {
        board = Board();
        game = StandardTTT(board: board)
    }

  it("recongnizes a row win") {
    board.move(position: 3, marker: "X")
    board.move(position: 4, marker: "X")
    board.move(position: 5, marker: "X")
    expect(game.isWin())
  }
  it("recongnizes a column win") {
    board.move(position: 2, marker: "X")
    board.move(position: 5, marker: "X")
    board.move(position: 8, marker: "X")
    expect(game.isWin())
  }
  it("recongnizes a backward diagonal win") {
    board.move(position: 2, marker: "X")
    board.move(position: 4, marker: "X")
    board.move(position: 8, marker: "X")
    expect(game.isWin())
  }
  it("recongnizes a forward diagonal win") {
    board.move(position: 2, marker: "X")
    board.move(position: 4, marker: "X")
    board.move(position: 8, marker: "X")
    expect(game.isWin())
  }
  it("recongnizes a forward diagonal win") {
    board.move(position: 2, marker: "X")
    board.move(position: 4, marker: "X")
    board.move(position: 8, marker: "X")
    expect(game.isWin())
  }
  it("blank board is not a win") {
    expect(!game.isWin())
  }
  it("blank board is not a tie") {
    expect(!game.isTie())
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
    expect(game.isTie())
  }
}
import Speck
import TTT

let EndGameCriteriaSpec = describe("endGameCriteria") {
  var board: Board = Board()
  var endGameCriteria: EndGameCriteria = StandardTTT()

  before {
      board = Board()
      endGameCriteria = StandardTTT()
  }

  it("recongnizes a row win") {
    board.move(position: 3, marker: "X")
    board.move(position: 4, marker: "X")
    board.move(position: 5, marker: "X")
    expect(endGameCriteria.isWin(board: board)).to(equal: true)
  }
  it("recongnizes a column win") {
    board.move(position: 2, marker: "X")
    board.move(position: 5, marker: "X")
    board.move(position: 8, marker: "X")
    expect(endGameCriteria.isWin(board: board)).to(equal: true)
  }
  it("recongnizes a backward diagonal win") {
    board.move(position: 2, marker: "X")
    board.move(position: 4, marker: "X")
    board.move(position: 6, marker: "X")
    expect(endGameCriteria.isWin(board: board)).to(equal: true)
  }
  it("recongnizes a forward diagonal win") {
    board.move(position: 0, marker: "X")
    board.move(position: 4, marker: "X")
    board.move(position: 8, marker: "X")
    expect(endGameCriteria.isWin(board: board)).to(equal: true)
  }
  it("blank board is not a win") {
    expect(endGameCriteria.isWin(board: board)).to(equal: false)
  }
  it("blank board is not a tie") {
    expect(endGameCriteria.isTie(board: board)).to(equal: false)
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
    expect(endGameCriteria.isTie(board: board)).to(equal: true)
  }
}
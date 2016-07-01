import Speck
import Core

let testSpec = describe("subtraction") {
  it("subtracts the first number to the second") {
    let board = Board()
    board.move(position: 0, marker: "X")
    board.move(position: 1, marker: "X")
    board.move(position: 6, marker: "O")
    board.move(position: 3, marker: "X")
    board.move(position: 4, marker: "O")
    board.move(position: 8, marker: "X")
    expect(board.getDiagonals().forwardDiagonal).to(equal: ["2", "O", "O"])
    expect(board.getDiagonals().backwardDiagonal).to(equal: ["X", "O", "X"])
  }
}
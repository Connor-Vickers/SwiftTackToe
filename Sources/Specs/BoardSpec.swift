import Speck
import Core

let BoardSpec = describe("board") {
  it("default size of 3") {
    let board = Board();
    expect(board.getSize()).to(equal: 3)
  }
  it("can set and get positions") {
    let board = Board();
    board.move(position: 3, marker: "X")
    expect(board.getMarkerAtPosition(position:3)).to(equal: "X")
  }
  it("can get avaliable positions") {
    let board = Board();
    board.move(position: 0, marker: "X")
    board.move(position: 1, marker: "X")
    board.move(position: 6, marker: "X")
    board.move(position: 3, marker: "X")
    board.move(position: 4, marker: "X")
    board.move(position: 8, marker: "X")
    expect(board.getAvaliablePositions()).to(equal: [2,5,7])
  }
}
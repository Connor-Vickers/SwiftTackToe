import Speck
import Core

let UISpec = describe("UI") {
  it("displays a blank board") {
    let testIO = TestIO()
    let io: IO = testIO
    let board = Board()
    let ui = UI(io: io)
    ui.displayBoard(board: board)
    expect(testIO.getOutputAsASingleString()).to(equal: "\n0|1|2\n_____\n3|4|5\n_____\n6|7|8\n")
  }
}
import Speck
import Core

let GameManagerSpec = describe("game manager"){
  var io :IO = CommandLine()
  var ui = UI(io: io)
  var endGameCriteria = StandardTTT()
  var gameOptions = parse(arguments: Process.arguments)
  var gameManager = GameManager(options: gameOptions, endGameCriteria: endGameCriteria, ui: ui)

  before {
    var io :IO = CommandLine()
    var ui = UI(io: io)
    var endGameCriteria = StandardTTT()
    var gameOptions = parse(arguments: Process.arguments)
    var gameManager = GameManager(options: gameOptions, endGameCriteria: endGameCriteria, ui: ui)

  }

  it("recongnizes a tie") {
    // board.move(position: 0, marker: "X")
    // board.move(position: 1, marker: "O")
    // board.move(position: 2, marker: "X")
    // board.move(position: 3, marker: "X")
    // board.move(position: 4, marker: "O")
    // board.move(position: 5, marker: "X")
    // board.move(position: 6, marker: "O")
    // board.move(position: 7, marker: "X")
    // board.move(position: 8, marker: "O")
    // gameManager.start()
    // expect(io.getOutputAsASingleString()).to(equal: "\nX|O|X\n_____\nX|O|X\n_____\nO|X|O\nGame was a Tie")
  }

  it("recongnizes a row win") {
    // board.move(position: 0, marker: "O")
    // board.move(position: 1, marker: "O")
    // board.move(position: 2, marker: "O")
    // gameManager.start()
    // expect(io.getOutputAsASingleString()).to(equal: "\nO|O|O\n_____\n3|4|5\n_____\n6|7|8\nO Won!\n")
  }

  //it("creates default game when given no argumants") {
    //gameManager = GameManager(argumants: ["path"])
    // expect(io.getOutputAsASingleString()).to(equal: "\nX|O|X\n_____\nX|O|X\n_____\nO|X|O\nGame was a Tie")
  //}

}
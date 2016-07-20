 import Speck
 import TTT
 import CLI

let CLIParserSpec = describe("cli parser") {
  it("returns the default configuration when no args are received") {
		var resultOptions = parse(arguments: []) {_ in}
		expect(resultOptions.size).to(equal: 3)
		var correctFirstPlayer = false
		if case let TTT.Options.PlayerOption.Human(marker) = resultOptions.firstPlayer{
			correctFirstPlayer = marker == "X"
		}
		expect(correctFirstPlayer).to(equal: true)

		var correctSecondPlayer = false
		if case let TTT.Options.PlayerOption.Human(marker) = resultOptions.secondPlayer{
			correctSecondPlayer = marker == "O"
		}
		expect(correctSecondPlayer).to(equal: true)
  }

  it("recongnizes a size parameter") {
 		var resultOptions = parse(arguments: ["--size", "4"]) {_ in}
 		expect(resultOptions.size).to(equal: 4)
  }

  it("recongnizes a playermarker parameter") {
    var resultOptions = parse(arguments: ["--firstPlayerMarker", "U", "--secondPlayerMarker", "L"]) {_ in}
    var correctFirstPlayer = false
    if case let TTT.Options.PlayerOption.Human(marker) = resultOptions.firstPlayer{
      correctFirstPlayer = marker == "U"
    }
    expect(correctFirstPlayer).to(equal: true)

    var correctSecondPlayer = false
    if case let TTT.Options.PlayerOption.Human(marker) = resultOptions.secondPlayer{
      correctSecondPlayer = marker == "L"
    }
    expect(correctSecondPlayer).to(equal: true)
    }

  it("recongnizes a playerType parameter") {
 		var resultOptions = parse(arguments: ["--firstPlayerType", "Computer", "--secondPlayerType", "Computer"]) {_ in}
 		var correctFirstPlayer = false
	  if case let TTT.Options.PlayerOption.Computer(marker) = resultOptions.firstPlayer{
		 correctFirstPlayer = true
	  }
	  expect(correctFirstPlayer).to(equal: true)

	  var correctSecondPlayer = false
	  if case let TTT.Options.PlayerOption.Computer(marker) = resultOptions.secondPlayer{
		 correctSecondPlayer = true
	  }
	  expect(correctSecondPlayer).to(equal: true)
    }
  it("asserts when playermarker is a number") {
  	let _ = parse(arguments: ["--firstPlayerMarker", "1"]) { expect($0).to(equal: "Invalid Marker: 1") }
 	}

 	it("asserts when playermarker is a more than one caracter") {
  	let _ = parse(arguments: ["--firstPlayerMarker", "hi"]) { expect($0).to(equal: "Invalid Marker: hi") }
 	}

 	it("asserts when playermarker is the same for both players") {
  	let _ = parse(arguments: ["--firstPlayerMarker", "A", "--secondPlayerMarker", "A"]) {expect($0).to(equal: "Both Players can not have the same marker")}
 	}  
}


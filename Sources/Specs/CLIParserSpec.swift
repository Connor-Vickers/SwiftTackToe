 import Speck
 import Core

let CLIParserSpec = describe("cli parser") {
    it("returns the default configuration when no args are received") {
		var resultOptions = parse(arguments: [])
		expect(resultOptions.size).to(equal: 3)
		var correctFirstPlayer = false
		if case let Core.Options.PlayerOption.Human(marker) = resultOptions.firstPlayer{
			correctFirstPlayer = marker == "X"
		}
		expect(correctFirstPlayer).to(equal: true)

		var correctSecondPlayer = false
		if case let Core.Options.PlayerOption.Human(marker) = resultOptions.secondPlayer{
			correctSecondPlayer = marker == "O"
		}
		expect(correctSecondPlayer).to(equal: true)
    }

    it("recongnizes a size parameter") {
   		var resultOptions = parse(arguments: ["--size", "4"])
   		expect(resultOptions.size).to(equal: 4)
    }

    it("recongnizes a playermarker parameter") {
   		var resultOptions = parse(arguments: ["--firstPlayerMarker", "U", "--secondPlayerMarker", "L"])
   		var correctFirstPlayer = false
		if case let Core.Options.PlayerOption.Human(marker) = resultOptions.firstPlayer{
			correctFirstPlayer = marker == "U"
		}
		expect(correctFirstPlayer).to(equal: true)

		var correctSecondPlayer = false
		if case let Core.Options.PlayerOption.Human(marker) = resultOptions.secondPlayer{
			correctSecondPlayer = marker == "L"
		}
		expect(correctSecondPlayer).to(equal: true)
    }

    it("recongnizes a playerType parameter") {
   		var resultOptions = parse(arguments: ["--firstPlayerType", "Computer", "--secondPlayerType", "Computer"])
   		var correctFirstPlayer = false
		if case let Core.Options.PlayerOption.Computer(marker) = resultOptions.firstPlayer{
			correctFirstPlayer = true
		}
		expect(correctFirstPlayer).to(equal: true)

		var correctSecondPlayer = false
		if case let Core.Options.PlayerOption.Computer(marker) = resultOptions.secondPlayer{
			correctSecondPlayer = true
		}
		expect(correctSecondPlayer).to(equal: true)
    }
}


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
    it("asserts when playermarker is a number") {
    	func assertFunc(passed: Bool, message: String){
    		if !passed{
    			expect(message).to(equal: "Invalid Marker: 1")
    		}
    	} 
    	parse(arguments: ["--firstPlayerMarker", "1"], assertFunc: assertFunc)
   	}

   	it("asserts when playermarker is a more than one caracter") {
    	func assertFunc(passed: Bool, message: String){
    		if !passed{
    			expect(message).to(equal: "Invalid Marker: hi")
    		}
    	} 
    	parse(arguments: ["--firstPlayerMarker", "hi"], assertFunc: assertFunc)
   	}

   	it("asserts when playermarker is the same for both players") {
    	func assertFunc(passed: Bool, message: String){
    		if !passed{
    			expect(message).to(equal: "Both Players can not have the same marker")
    		}
    	} 
    	parse(arguments: ["--firstPlayerMarker", "A", "--secondPlayerMarker", "A"], assertFunc: assertFunc)
   	}  
}


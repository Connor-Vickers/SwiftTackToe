import XTest
import Core

class HumanSpec: Group {
    let usesPassedMarker = Test { assert in
        let io: IO = TestIO(inputs: ["1"])
        let ui = UI(io: io)
        let human = Human(marker:"X", ui: ui)
        assert.that(human.marker, equals: "X")
    }
    
    let getMoveReturnsAnIntTest = Test { assert in
        let testIO = TestIO(inputs: ["lol","1"])
        let io: IO = testIO
        let ui = UI(io: io)
        let human = Human(marker:"X", ui: ui)
        assert.that(human.getMove(avaliableMoves: [1]), equals: 1)
        assert.that(testIO.outputs[0], equals: "Select a Move:")
        assert.that(testIO.outputs[1], equals: "Invalid Input Please Try Again")
        assert.that(testIO.outputs.count, equals: 2)
    }
}
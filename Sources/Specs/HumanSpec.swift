import XTest
import Core

class HumanSpec: Group {
    let usesPassedMarker = Test { assert in
        let io: IO = testIO(inputs: ["1"])
        let human = Human(marker:"X", io: io)
        assert.that(human.marker, equals: "X")
    }
    
    let getMoveReturnsAnIntTest = Test { assert in
        let testio = testIO(inputs: ["lol","1"])
        let io: IO = testio
        let human = Human(marker:"X", io: io)
        assert.that(human.getMove(avaliableMoves: [1]), equals: 1)
        assert.that(testio.outputs[0], equals: "Select a Move:")
        assert.that(testio.outputs[1], equals: "Invalid Input Please Try Again")
        assert.that(testio.outputs[2], equals: "Select a Move:")
        assert.that(testio.outputs.count, equals: 3)
    }
}
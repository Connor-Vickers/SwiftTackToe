import XTest
import Core

class HumanSpec: Group {
    let getMoveReturnsAnIntTest = Test { assert in
        let human = Human(marker:"X")
        assert.that(human.getMove(avaliableMoves: [1]), equals: 1)
    }
}
import XTest
import Core

class UISpec: Group {

    
    let getMoveReturnsAnIntTest = Test { assert in
        let testIO = TestIO()
        let io: IO = testIO
        let board = Board()
        UI.displayBoard(board: board, io: io)
        assert.that(testIO.getOutputAsASingleString(), equals:"\n0|1|2\n_____\n3|4|5\n_____\n6|7|8\n")
    }
}
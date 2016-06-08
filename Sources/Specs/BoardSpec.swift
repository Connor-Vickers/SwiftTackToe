import XTest
import Core

class BoardSpec: Group {
	let sizeTest = Test { assert in
        let board = Board();
		assert.that(board.getSize(), equals: 3, message: "default board size should be 3")
	}
}

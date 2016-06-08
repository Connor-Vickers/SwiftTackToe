import XTest
import Core

class BoardSpec: Group {
	let sizeTest = Test { assert in
        let board = Board();
		assert.that(board.getSize(), equals: 3, message: "default board size should be 3")
	}
    let setMoveTest = Test { assert in
        let board = Board();
        board.move(position: 3, marker: "X")
        assert.that(board.getPosition(position:3), equals: "X", message: "board should set move and get position")
    }
}
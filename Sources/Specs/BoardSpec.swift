import XTest
import Core

class BoardSpec: Group {
	let sizeTest = Test { assert in
        let board = Board();
		assert.that(board.getSize(), equals: 3, message: "default board size should be 3")
	}
    let MoveAndGetPositionTest = Test { assert in
        let board = Board();
        board.move(position: 3, marker: "X")
        assert.that(board.getMarkerAtPosition(position:3), equals: "X")
    }
    let canGetAvaliablePositions = Test { assert in
        let board = Board();
        board.move(position: 0, marker: "X")
        board.move(position: 1, marker: "X")
        board.move(position: 6, marker: "X")
        board.move(position: 3, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 8, marker: "X")
        assert.that(board.getAvaliablePositions()[0], equals: 2)
        assert.that(board.getAvaliablePositions()[1], equals: 5)
        assert.that(board.getAvaliablePositions()[2], equals: 7)
    }

}
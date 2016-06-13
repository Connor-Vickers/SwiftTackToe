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
      /*let canGetAvaliablePositions = Test { assert in
        let board = Board();
        board.move(position: 2, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 6, marker: "X")
        //todo assert.that(board.getAvaliablePositions()
    }*/
}
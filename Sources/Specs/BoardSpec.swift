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
    let rowWinTest = Test { assert in
        let board = Board();
        board.move(position: 3, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 5, marker: "X")
        assert.that(board.isWin(), equals: true, message: "board should should reconise row win")
    }
    let colWinTest = Test { assert in
        let board = Board();
        board.move(position: 2, marker: "X")
        board.move(position: 5, marker: "X")
        board.move(position: 8, marker: "X")
        assert.that(board.isWin(), equals: true, message: "board should should reconise col win")
    }
    let backslashWinTest = Test { assert in
        let board = Board();
        board.move(position: 0, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 8, marker: "X")
        assert.that(board.isWin(), equals: true, message: "board should should reconise backslash win")
    }
    let forwardslashWinTest = Test { assert in
        let board = Board();
        board.move(position: 2, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 6, marker: "X")
        assert.that(board.isWin(), equals: true, message: "board should should reconise forwardslash win")
    }
    let noWinTest = Test { assert in
        let board = Board();
        assert.that(board.isWin(), equals: false, message: "board should should reconise when no win occurs")
    }
    let boardCanGetAvaliablePositions = Test { assert in
        let board = Board();
        board.move(position: 2, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 6, marker: "X")
        //todo assert.that(board.getAvaliablePositions()
}
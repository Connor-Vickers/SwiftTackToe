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
    let rowWinTest = Test { assert in
        let board = Board();
        board.move(position: 3, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 5, marker: "X")
        assert.that(board.isWin())
    }
    let colWinTest = Test { assert in
        let board = Board();
        board.move(position: 2, marker: "X")
        board.move(position: 5, marker: "X")
        board.move(position: 8, marker: "X")
        assert.that(board.isWin())
    }
    let backwardDiagonalsWinTest = Test { assert in
        let board = Board();
        board.move(position: 0, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 8, marker: "X")
        assert.that(board.isWin(), equals: true)
    }
    let forwardDiagonalsWinTest = Test { assert in
        let board = Board();
        board.move(position: 2, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 6, marker: "X")
        assert.that(board.isWin(), equals: true)
    }
    let noWinTest = Test { assert in
        let board = Board();
        assert.that(board.isWin(), equals: false)
    }
    /*let boardCanGetAvaliablePositions = Test { assert in
        let board = Board();
        board.move(position: 2, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 6, marker: "X")
        //todo assert.that(board.getAvaliablePositions()
    }*/
    let boardCanDetectTie = Test { assert in
        let board = Board();
        board.move(position: 0, marker: "X")
        board.move(position: 1, marker: "O")
        board.move(position: 2, marker: "X")
        board.move(position: 3, marker: "X")
        board.move(position: 4, marker: "O")
        board.move(position: 5, marker: "X")
        board.move(position: 6, marker: "O")
        board.move(position: 7, marker: "X")
        board.move(position: 8, marker: "O")
        assert.that(board.isTie())
    }
}
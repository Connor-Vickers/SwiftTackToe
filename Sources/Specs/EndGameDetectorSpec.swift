import XTest
import Core

class EndGameDetectorSpec: Group {

    let rowWinTest = Test { assert in
        let board = Board();
        board.move(position: 3, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 5, marker: "X")
        assert.that(EndGameDetector.isWin(board: board))
    }
    let colWinTest = Test { assert in
        let board = Board();
        board.move(position: 2, marker: "X")
        board.move(position: 5, marker: "X")
        board.move(position: 8, marker: "X")
        assert.that(EndGameDetector.isWin(board: board))
    }
    let backwardDiagonalsWinTest = Test { assert in
        let board = Board();
        board.move(position: 0, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 8, marker: "X")
        assert.that(EndGameDetector.isWin(board: board))
    }
    let forwardDiagonalsWinTest = Test { assert in
        let board = Board();
        board.move(position: 2, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 6, marker: "X")
        assert.that(EndGameDetector.isWin(board: board))
    }
    let noWinTest = Test { assert in
        let board = Board();
        assert.that(!EndGameDetector.isWin(board: board))
    }
    let noTieTest = Test { assert in
        let board = Board();
        assert.that(!EndGameDetector.isTie(board: board))
    }
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
        assert.that(EndGameDetector.isTie(board: board))
    }
}
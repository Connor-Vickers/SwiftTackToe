import XTest
import Core

struct GameSpec: Group {
    static var board: Board = Board();
    static var game: Game = Game(board: board)
    
    func before() {
        //board = Board();
        //game = Game(board: board)
    }

    let rowWinTest = Test { assert in
        
        board.move(position: 3, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 5, marker: "X")
        assert.that(game.isWin())
    }
    let colWinTest = Test { assert in
        board.move(position: 2, marker: "X")
        board.move(position: 5, marker: "X")
        board.move(position: 8, marker: "X")
        assert.that(game.isWin())
    }
    let backwardDiagonalsWinTest = Test { assert in
        board.move(position: 0, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 8, marker: "X")
        assert.that(game.isWin())
    }
    let forwardDiagonalsWinTest = Test { assert in
        board.move(position: 2, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 6, marker: "X")
        assert.that(game.isWin())
    }
    let noWinTest = Test { assert in
        assert.that(!game.isWin())
    }
    let noTieTest = Test { assert in
        assert.that(!game.isTie())
    }
    let boardCanDetectTie = Test { assert in
        board.move(position: 0, marker: "X")
        board.move(position: 1, marker: "O")
        board.move(position: 2, marker: "X")
        board.move(position: 3, marker: "X")
        board.move(position: 4, marker: "O")
        board.move(position: 5, marker: "X")
        board.move(position: 6, marker: "O")
        board.move(position: 7, marker: "X")
        board.move(position: 8, marker: "O")
        assert.that(!game.isTie())
    }
}
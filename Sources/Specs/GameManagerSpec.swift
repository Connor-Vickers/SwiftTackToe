import XTest
import Core

struct GameManagerSpec: Group {
	static var board: Board = Board();
    static var game: Game = StandardTTT(board: GameManagerSpec.board)
    static var player1: Player = PlayerMock(marker: "X")
    static var player2: Player = PlayerMock(marker: "O")
    static var io: IO = TestIO(inputs:[])
    static var gameManager: GameManager = GameManager(player1: player1, player2: player2, io: io, board: board, game: game)

    
    func before() {
        GameManagerSpec.board = Board();
        GameManagerSpec.game = StandardTTT(board: GameManagerSpec.board)
        GameManagerSpec.player1 = PlayerMock(marker: "X")
    	GameManagerSpec.player2 = PlayerMock(marker: "O")
    	GameManagerSpec.io = TestIO(inputs:[])

        GameManagerSpec.gameManager = GameManager(player1: GameManagerSpec.player1, player2: GameManagerSpec.player2, io: GameManagerSpec.io, board: GameManagerSpec.board, game: GameManagerSpec.game)

    }

    let rowWinTest = Test { assert in
        
        board.move(position: 3, marker: "X")
        board.move(position: 4, marker: "X")
        board.move(position: 5, marker: "X")
        assert.that(game.isWin())
    }
}
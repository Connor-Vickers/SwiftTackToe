import XTest
import Core

struct GameManagerSpec: Group {
	static var board: Board = Board();
    static var game: Game = StandardTTT(board: GameManagerSpec.board)
    static var player1: Player = PlayerMock(marker: "X")
    static var player2: Player = PlayerMock(marker: "O")
    static var io: TestIO = TestIO(inputs:[])
    static var gameManager: GameManager = GameManager(player1: player1, player2: player2, io: io, board: board, game: game)

    
    func before() {
        GameManagerSpec.board = Board();
        GameManagerSpec.game = StandardTTT(board: GameManagerSpec.board)
        GameManagerSpec.player1 = PlayerMock(marker: "X")
    	GameManagerSpec.player2 = PlayerMock(marker: "O")
    	GameManagerSpec.io = TestIO(inputs:[])

        GameManagerSpec.gameManager = GameManager(player1: GameManagerSpec.player1, player2: GameManagerSpec.player2, io: GameManagerSpec.io, board: GameManagerSpec.board, game: GameManagerSpec.game)

    }

    let outputResultsOfTieTest = Test { assert in
        board.move(position: 0, marker: "X")
        board.move(position: 1, marker: "O")
        board.move(position: 2, marker: "X")
        board.move(position: 3, marker: "X")
        board.move(position: 4, marker: "O")
        board.move(position: 5, marker: "X")
        board.move(position: 6, marker: "O")
        board.move(position: 7, marker: "X")
        board.move(position: 8, marker: "O")
        gameManager.start()
        assert.that(io.getOutputAsASingleString(), equals: "\nX|O|X\n_____\nX|O|X\n_____\nO|X|O\nGame was a Tie")
    }

    let outputResultsOfWinTest = Test { assert in
        board.move(position: 0, marker: "O")
        board.move(position: 1, marker: "O")
        board.move(position: 2, marker: "O")
        gameManager.start()
        assert.that(io.getOutputAsASingleString(), equals: "\nO|O|O\n_____\n3|4|5\n_____\n6|7|8\nO won!\n")
    }
}
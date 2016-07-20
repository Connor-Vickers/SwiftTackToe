public protocol Player {
    func getMove(board: Board) -> Int
    var marker: String { get }
}
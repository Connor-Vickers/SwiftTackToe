protocol Player {
    func getMove(avaliableMoves: [Int]) -> Int
    var marker: String { get }
}
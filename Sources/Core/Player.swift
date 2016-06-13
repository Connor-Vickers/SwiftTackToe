protocol Player {
    var maker: String { get }
    init(marker: String)
    func getMove(avaliableMoves: [Int]) -> Int
    func getMarker() -> String
}
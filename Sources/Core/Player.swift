protocol Player {
    //let maker: String { get }
    //init(marker: String)
    func getMove(avaliableMoves: [Int]) -> Int
    func getMarker() -> String
}
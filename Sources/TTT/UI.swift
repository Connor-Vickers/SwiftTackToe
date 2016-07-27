public class UI{
    let io: IO
    public init(io: IO = CommandLine()){
        self.io = io
    }
    public func displayBoard(board: Board){
        io.output(message: "\n")
        let rows = board.getRows()
        for row in rows.dropLast(){
            printRow(row: row)
            printUnderscore(times: (row.count * 2)-1)
        }
        if let lastRow = rows.last{
            printRow(row: lastRow)
        }
        
    }
    func printRow(row: [String]){
        for element in row.dropLast(){
            io.output(message: (element + "|"))
        }
        if let lastElement = row.last{
            io.output(message: lastElement)
        }
        io.output(message: "\n")
    }
    func printUnderscore(times: Int){
        var i = 0
        while(i < times){
            io.output(message: "_")
            i += 1
        }
        io.output(message: "\n")
    }
    public func promptSelectMove(){
        io.output(message: "Select a Move:")
    }
    public func promptInvalid(){
        io.output(message: "Invalid Input Please Try Again")
    }
    public func getInput(validInputs: [Int]) -> Int{
        while true {
            if let inputString = io.input() {
                if let inputInt = Int(inputString) {
                    if validInputs.contains(inputInt) {
                        return inputInt
                    }
                }
            }
            promptInvalid()
        }
    }
    public func promptTurn(player: Player){
        io.output(message: "\(player.marker)'s turn\n")
    }
    public func promptWon(player: Player){
        io.output(message: "\(player.marker) Won!\n")
    }
    public func promptTie(){
        io.output(message: "Game was a Tie")        
    }
}
public class UI{
    let io: IO
    public init(io: IO){
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
    public func getInput(isValidFunction: (String) -> Bool) -> String{
        while true {
            if let input = io.input() {
                if isValidFunction(input){
                    return input
                }
            }
            promptInvalid()
        }
    }
    //---------------------------------------------------------
    public static func displayBoard(board: Board, io: IO){
        io.output(message: "\n")
        let rows = board.getRows()
        for row in rows.dropLast(){
            printRow(row: row, io:io)
            printUnderscore(times: (row.count * 2)-1, io:io)
        }
        if let lastRow = rows.last{
            printRow(row: lastRow, io:io)
        }
        
    }
    static func printRow(row: [String], io: IO){
        for element in row.dropLast(){
            io.output(message: (element + "|"))
        }
        if let lastElement = row.last{
            io.output(message: lastElement)
        }
        io.output(message: "\n")
    }
    static func printUnderscore(times: Int, io: IO){
        var i = 0
        while(i < times){
            io.output(message: "_")
            i += 1
        }
        io.output(message: "\n")
    }
}
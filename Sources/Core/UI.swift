public class UI{
    public static func displayBoard(board: Board, io: IO){
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
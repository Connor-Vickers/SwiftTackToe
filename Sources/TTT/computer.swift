import Glibc

public class DumbCPU{
	let marker: String
	public init(marker: String){
		self.marker = marker
	}
	public func getMove(board: Board) -> Int{
		return board.getAvaliablePositions()[0]		
	}
}
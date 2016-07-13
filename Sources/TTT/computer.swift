import Glibc

public class DumbCPU{
	let marker: String
	public init(marker: String){
		self.marker = marker
	}
	public func getMove(avaliableMoves: [Int]) -> Int{
		let randomIndex = Int(drand48()*Double(avaliableMoves.count))
		return avaliableMoves[randomIndex]
	}
}
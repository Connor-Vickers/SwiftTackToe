import TTT
import Speck

let dumbCPUSpec = describe("dumb computer") {
	it("selects the only remaining move if only one move avaliable"){
		let comp = DumbCPU(marker: "X")
		expect(comp.getMove(avaliableMoves:[1])).to(equal: 1)
	}
	it("selects all avaliable moves with equal probibility"){
		var timesSelected = [0:0, 1:0, 2:0, 3:0]
		let comp = DumbCPU(marker: "X")
		for _ in 0...100{
			timesSelected[comp.getMove(avaliableMoves:[0,1,2,3])]! += 1
		}
		expect(timesSelected[0]).to(beGreaterThanOrEqual: 10)
		expect(timesSelected[1]).to(beGreaterThanOrEqual: 10)
		expect(timesSelected[2]).to(beGreaterThanOrEqual: 10)
		expect(timesSelected[3]).to(beGreaterThanOrEqual: 10)
	}
}
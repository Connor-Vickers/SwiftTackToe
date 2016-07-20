import TTT
import Speck

let DumbCPUSpec = describe("dumb computer") {
	it("selects the first avaliable move"){
		let comp = DumbCPU(marker: "X")
		expect(comp.getMove(board: Board())).to(equal: 0)
	}
}
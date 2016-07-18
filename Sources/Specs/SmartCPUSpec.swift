import Speck
import TTT

let SmartCPUSpec = describe("SmartCPU") {
	it("conforms to player") {
		let cpu: Player = SmartCPU(marker: "X")
		expect(cpu.marker).to(equal: "X")
	}

	it("passed in marker is set") {
		let cpu: Player = SmartCPU(marker: "O")
		expect(cpu.marker).to(equal: "O")
	}

	// xit("chooses corner in empty 3x3 Board") {
	// 	let cpu = SmartCPU(marker: "X")
	// 	let possibleMoves = [Int](0...8)
	// 	let move = cpu.getMove(availableMoves: possibleMoves)

	// 	expect([0, 2, 6, 8]).to(contain: move)
	// }

	// xit("chooses middle as second move when corner is taken") {
	// 	let cpu = SmartCPU(marker: "X")
	// 	let possibleMoves = [Int](1...8)
	// 	let move = cpu.getMove(availableMoves: possibleMoves)

	// 	expect(move).to(equal: 4)
	// }
}
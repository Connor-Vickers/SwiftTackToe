import Speck
import TTT

let SmartCPUSpec = describe("SmartCPU") {
	it("conforms to player") {
		let cpu: Player = SmartCPU(marker: "X", opponateMarker: "O")
		expect(cpu.marker).to(equal: "X")
	}

	it("passed in marker is set") {
		let cpu: Player = SmartCPU(marker: "O", opponateMarker: "X")
		expect(cpu.marker).to(equal: "O")
	}

	it("picks a winning move if avaliable") {
		let cpu: Player = SmartCPU(marker: "O", opponateMarker: "X")
		let board = Board(state: ["O","1","2","3","O","5","6","7","8"])
		expect(cpu.getMove(board: board)).to(equal: 8)
	}

	it("block an oponates winning move if avaliable") {
		let cpu: Player = SmartCPU(marker: "O", opponateMarker: "X")
		let board = Board(state: ["0","1","X","3","X","5","6","7","8"])
		expect(cpu.getMove(board: board)).to(equal: 6)
	}

	it("picks a winning move instead of a blocking if both are avaliable") {
		let cpu: Player = SmartCPU(marker: "O", opponateMarker: "X")
		let board = Board(state: ["O","1","X","O","4","X","6","7","8"])
		expect(cpu.getMove(board: board)).to(equal: 6)
	}

	it("picks a move to tie if no other options exist") {
		let cpu: Player = SmartCPU(marker: "O", opponateMarker: "X")
		let board = Board(state: ["O","O","X","X","O","O","O","X","8"])
		expect(cpu.getMove(board: board)).to(equal: 8)
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
import Speck
import TTT

let SmartCPUSpec = describe("SmartCPU") {
	it("conforms to player") {
		let cpu: Player = SmartCPU(marker: "X", opponentMarker: "O")
		expect(cpu.marker).to(equal: "X")
	}

	it("passed in marker is set") {
		let cpu: Player = SmartCPU(marker: "O", opponentMarker: "X")
		expect(cpu.marker).to(equal: "O")
	}

	it("picks a winning move if avaliable") {
		let cpu: Player = SmartCPU(marker: "O", opponentMarker: "X")
		let board = Board(state: ["O","1","2","3","O","5","6","7","8"])
		expect(cpu.getMove(board: board)).to(equal: 8)
	}

	// of depth 2 doing next
	// it("block an oponates winning move if avaliable") {
	// 	let cpu: Player = SmartCPU(marker: "O", opponentMarker: "X")
	// 	let board = Board(state: ["0","1","X","3","X","5","6","7","8"])
	// 	expect(cpu.getMove(board: board)).to(equal: 6)
	// }

	it("picks a winning move instead of a blocking if both are avaliable") {
		let cpu: Player = SmartCPU(marker: "O", opponentMarker: "X")
		let board = Board(state: ["O","1","X","O","4","X","6","7","8"])
		expect(cpu.getMove(board: board)).to(equal: 6)
	}

	it("picks a move to tie if no other options exist") {
		let cpu: Player = SmartCPU(marker: "O", opponentMarker: "X")
		let board = Board(state: ["O","O","X","X","O","O","O","X","8"])
		expect(cpu.getMove(board: board)).to(equal: 8)
	}

}
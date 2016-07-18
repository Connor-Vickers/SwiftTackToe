@testable import TTT
extension Board {
	init (state: [String]){
		markers = state
		size = 3
		moves = [Int]()
	}
}
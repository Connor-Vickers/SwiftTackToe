public struct Options {
	public init(firstPlayer: PlayerOption, secondPlayer: PlayerOption, size: Int){
		self.firstPlayer = firstPlayer
		self.secondPlayer = secondPlayer
		self.size = size
	}
	public enum PlayerOption {
		case Human(String), Computer(String)
	}

	public let firstPlayer: PlayerOption
	public let secondPlayer: PlayerOption
	public let size: Int
}
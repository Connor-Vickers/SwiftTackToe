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

public func parse(arguments: [String], assertFunc: (Bool,String)->Void = {(expect: Bool, message: String) in  assert(expect, message)}) -> Options {
	let size = Int(findArgument(arguments: arguments, key:"size", defaultValue:"3")) ?? 0
	assertFunc(size > 0, "Invalid size: \(size)")

	let firstPlayerMarker = findArgument(arguments: arguments, key:"firstPlayerMarker", defaultValue: "X")
	let secondPlayerMarker = findArgument(arguments: arguments, key:"secondPlayerMarker", defaultValue: "O")
	assertFunc(checkIfValidMarker(marker: firstPlayerMarker), "Invalid Marker: \(firstPlayerMarker)")
	assertFunc(checkIfValidMarker(marker: secondPlayerMarker), "Invalid Marker: \(secondPlayerMarker)")

	assertFunc(firstPlayerMarker != secondPlayerMarker, "Both Players can not have the same marker")
	
	let firstPlayerType = findArgument(arguments: arguments, key:"firstPlayerType", defaultValue: "Human")
	let secondPlayerType = findArgument(arguments: arguments, key:"secondPlayerType", defaultValue: "Human")
	
	let firstPlayer = toPlayerOption(playerType: firstPlayerType, playerMarker: firstPlayerMarker)
	let secondPlayer = toPlayerOption(playerType: secondPlayerType, playerMarker: secondPlayerMarker)

	return Options(firstPlayer: firstPlayer, secondPlayer: secondPlayer, size: size)
}

private func checkIfValidMarker(marker: String) -> Bool {
	return marker.characters.count == 1 && !(marker >= "0" && marker <= "9")
}

private func toPlayerOption(playerType: String, playerMarker: String) -> Options.PlayerOption{
	switch playerType {
		case "Human":
			return Options.PlayerOption.Human(playerMarker)
		case "Computer":
			return Options.PlayerOption.Computer(playerMarker)
		default:
			assert(false, "Invalid Player Type \(playerType)")
	}
}

private func findArgument(arguments: [String], key: String, defaultValue: String) -> String {
	return arguments.index { $0 == "--" + key }.map { arguments[$0 + 1] } ?? defaultValue
}
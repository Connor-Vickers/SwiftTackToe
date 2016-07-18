import TTT

public func parse(arguments: [String], fail: (String) -> Void) -> Options{
	let size = Int(findArgument(arguments: arguments, key:"size", defaultValue:"3")) ?? 0
	if(size <= 0){
		fail("Invalid size: \(size)")
	}

	let firstPlayerMarker = findArgument(arguments: arguments, key:"firstPlayerMarker", defaultValue: "X")
	let secondPlayerMarker = findArgument(arguments: arguments, key:"secondPlayerMarker", defaultValue: "O")
	if invalidMarker(marker: firstPlayerMarker){
		fail("Invalid Marker: \(firstPlayerMarker)")
	}
	if invalidMarker(marker: secondPlayerMarker){
		fail("Invalid Marker: \(secondPlayerMarker)")
	}

	if(firstPlayerMarker == secondPlayerMarker){
		fail("Both Players can not have the same marker")
	}
	
	let firstPlayerType = findArgument(arguments: arguments, key:"firstPlayerType", defaultValue: "Human")
	let secondPlayerType = findArgument(arguments: arguments, key:"secondPlayerType", defaultValue: "Human")
	
	let firstPlayer = toPlayerOption(playerType: firstPlayerType, playerMarker: firstPlayerMarker, fail: fail)
	let secondPlayer = toPlayerOption(playerType: secondPlayerType, playerMarker: secondPlayerMarker, fail: fail)

	return Options(firstPlayer: firstPlayer, secondPlayer: secondPlayer, size: size)
}

private func invalidMarker(marker: String) -> Bool {
	return marker.characters.count != 1 || (marker >= "0" && marker <= "9")
}

private func toPlayerOption(playerType: String, playerMarker: String, fail: (String)->Void) -> Options.PlayerOption{
	switch playerType {
		case "Human":
			return Options.PlayerOption.Human(playerMarker)
		case "Computer":
			return Options.PlayerOption.Computer(playerMarker)
		default:
			fail("Invalid Player Type \(playerType)")
			assert(false)
	}
}

private func findArgument(arguments: [String], key: String, defaultValue: String) -> String {
	return arguments.index { $0 == "--" + key }.map { arguments[$0 + 1] } ?? defaultValue
}
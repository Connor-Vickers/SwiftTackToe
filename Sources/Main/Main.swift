import Core

let io :IO = CommandLine()
let ui = UI(io: io)
let endGameCriteria = StandardTTT()
let gameOptions = parse(arguments: Process.arguments) { assertionFailure($0) }
let gameManager = GameManager(options: gameOptions, endGameCriteria: endGameCriteria, ui: ui)

gameManager.start()
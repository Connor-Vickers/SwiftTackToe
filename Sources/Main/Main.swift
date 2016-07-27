import TTT
import CLI

let io :IO = CommandLine()
let ui = UI(io: io)
let gameCriteria = StandardTTT()
let gameOptions = parse(arguments: Process.arguments) { assertionFailure($0) }
let gameManager = GameManager(options: gameOptions, gameCriteria: gameCriteria, ui: ui)

gameManager.start()
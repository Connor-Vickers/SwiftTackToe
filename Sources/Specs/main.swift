import Speck
import CLI

Speck.register([UISpec, HumanSpec, BoardSpec, EndGameCriteriaSpec, GameManagerSpec, CLIParserSpec, dumbCPUSpec, SmartCPUSpec])
Speck.Reporter.listen(reporter)
try Speck.run()

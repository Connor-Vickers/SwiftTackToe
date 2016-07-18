import Speck
import CLI

Speck.register([UISpec, HumanSpec, BoardSpec, EndGameCriteriaSpec, GameManagerSpec, CLIParserSpec, dumbCPUSpec])
Speck.Reporter.listen(reporter)
try Speck.run()

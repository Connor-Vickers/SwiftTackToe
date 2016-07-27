import Speck
import CLI

Speck.register([UISpec, HumanSpec, BoardSpec, GameCriteriaSpec, GameManagerSpec, CLIParserSpec, DumbCPUSpec, SmartCPUSpec])
Speck.Reporter.listen(reporter)
try Speck.run()

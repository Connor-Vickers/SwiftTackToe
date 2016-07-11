import Speck

Speck.register([UISpec, HumanSpec, BoardSpec, EndGameCriteriaSpec, GameManagerSpec, CLIParserSpec])
Speck.Reporter.listen(reporter)
try Speck.run()

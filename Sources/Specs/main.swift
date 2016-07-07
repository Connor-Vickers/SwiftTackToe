import Speck

Speck.register([UISpec, HumanSpec, BoardSpec, EndGameCriteriaSpec, GameManagerSpec])
Speck.Reporter.listen(reporter)
try Speck.run()

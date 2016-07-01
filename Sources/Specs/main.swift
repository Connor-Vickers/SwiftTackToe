import Speck

Speck.register([UISpec, HumanSpec, BoardSpec, GameSpec, GameManagerSpec])
Speck.Reporter.listen(reporter)
try Speck.run()

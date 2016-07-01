import Speck

Speck.register([UISpec, HumanSpec, BoardSpec, GameSpec])
Speck.Reporter.listen(reporter)
try Speck.run()
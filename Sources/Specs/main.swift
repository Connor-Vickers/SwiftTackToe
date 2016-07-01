import XTest
import Speck
Suite(groups: BoardSpec(), GameSpec(), HumanSpec(), UISpec()).run()

Speck.register([testSpec])
Speck.Reporter.listen(reporter)
try Speck.run()
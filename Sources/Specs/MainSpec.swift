
import XTest
import Core

class MainSpec: Group {
	let zeroTest = Test { assert in 
		assert.that(Main.play(), equals: nil, message: "gives 0 pennies with 0 change")
	}
}

import XTest
import Core

public class testIO:IO {
    var inputs: [String]
    public var outputs = [String]()

    init(inputs: [String]){
        self.inputs = inputs
    }
    
    public func output(message: String){
        outputs.append(message)
    }
    
    public func input() -> String? {
        defer { inputs.removeFirst() }
        return inputs.first
    }
}


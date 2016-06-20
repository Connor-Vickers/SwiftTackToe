import XTest
import Core

public class TestIO:IO {
    var inputs: [String]
    public var outputs = [String]()

    init(inputs: [String] = []){
        self.inputs = inputs
    }
    
    public func output(message: String){
        outputs.append(message)
    }
    
    public func input() -> String? {
        defer { inputs.removeFirst() }
        return inputs.first
    }
    public func getOutputAsASingleString() -> String{
        var singleString = ""
        for element in outputs{
            singleString.append(element)
        }
        return singleString
    }
}


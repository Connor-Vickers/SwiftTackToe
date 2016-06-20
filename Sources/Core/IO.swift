public protocol IO {
    func output(message: String)
    func input() -> String?
}

public class CommandLine:IO {
    public init(){}
    public func output(message: String){
        print(message, terminator: "")
    }
    public func input() -> String? {
        return readLine(strippingNewline: true)
    }
}
public protocol IO {
    func output(message: String)
    func input() -> String?
}

class CommandLine:IO {
    func output(message: String){
        print(message)
    }
    func input() -> String? {
        return readLine(strippingNewline: true)
    }
}
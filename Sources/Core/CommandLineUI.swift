public class UI{
    let io : IO
    public init(io: IO){
        self.io = io
    }
    public func getInputUntilValid(userPrompt: String, validationCheckFunction: (String?) -> Bool){
        io.send(message: userPrompt)
        var input = io.get()
        while(!validationCheckFunction(input)){
            io.send(message: "Invaild Input. Please try again:")
            io.send(message: userPrompt)
            input = io.get()
        }
    }
}

public protocol IO {
    func send(message: String)
    func get()->String
}

public class CommandLine: IO{
    public init(){}
    public func send(message: String){
        print(message)
    }
    public func get()->String{
        return readLine(strippingNewline: true)!
    }
}

public class TestIO: IO{
    var sendCallTime = 0
    var getCallTime = 0
    let getMessages: [String]
    let sendTest: (message: String, callTime: Int) ->()
    public init(getMessages: [String], sendTest: (message: String, callTime: Int) ->()){
        self.getMessages = getMessages
        self.sendTest = sendTest
    }
    public func send(message: String){
        sendTest(message: message, callTime: sendCallTime)
        sendCallTime += 1
    }
    public func get()->String{
        getCallTime += 1
        return getMessages[getCallTime - 1]
        
    }
}
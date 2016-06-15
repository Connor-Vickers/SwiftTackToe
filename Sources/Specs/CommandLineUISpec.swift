import XTest
import Core

class CommandLineUISpec: Group {
    
    
    let TestIOTest = Test { assert in
        //let io = TestIO()
        //io.send(message: "hi")
        //assert.that(io.get(), equals: "hi", message: "the test io input/output that UI uses should work")
    }
    let UIRetryForInvalidInput = Test { assert in
        func function(in: String?) -> Bool{
            return true
        }
        //let senders = {"hi bob"}
        
        let userPrompt = "hi bob"
        //assert.that(board.getSize(), equals: 3, message: "default board size should be 3")
        
        func sendTest(message: String, callTime: Int)->(){
            switch callTime {
            case 0:
                assert.that(message, equals: userPrompt)
            case 1:
                assert.that(message, equals: "Invaild Input. Please try again:")
            case 2:
                assert.that(message, equals: userPrompt)
            default:
                assert.that(false, message: "TestIO.send was called to many times")
            }
        }
        let getMessages = ["mnbsdf","11"]
        
        let io = TestIO(getMessages: getMessages, sendTest: sendTest)
        let ui = UI(io: io)
        ui.getInput(userPrompt: userPrompt, validationCheckFunction: function)

    }
}
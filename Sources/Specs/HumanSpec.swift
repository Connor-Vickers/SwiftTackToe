import Speck
import TTT

let HumanSpec = describe("human") {
  it("usesPassedMarker") {
    let io: IO = TestIO(inputs: ["1"])
    let ui = UI(io: io)
    let human = Human(marker:"X", ui: ui)
    expect(human.marker).to(equal: "X")
  }
  it("get move selects a move") {
    let testIO = TestIO(inputs: ["lol","1"])
    let io: IO = testIO
    let ui = UI(io: io)
    let human = Human(marker:"X", ui: ui)
    expect(human.getMove(avaliableMoves: [1])).to(equal: 1)
    expect(testIO.outputs[0]).to(equal: "Select a Move:")
    expect(testIO.outputs[1]).to(equal: "Invalid Input Please Try Again")
    expect(testIO.outputs.count).to(equal: 2)
  }
}
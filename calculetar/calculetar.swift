import SwiftUI

struct calculetar: View {
    @State private var input: String = ""
    
    let buttons: [[String]] = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "*"],
        ["1", "2", "3", "-"],
        ["0", "C", "=", "+"]
    ]
    
    var body: some View {
        VStack {
            Text(input)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .background(Color.gray.opacity(0.2))
            
            ForEach(buttons, id: \..self) { row in
                HStack {
                    ForEach(row, id: \..self) { button in
                        Button(action: { self.buttonTapped(button) }) {
                            Text(button)
                                .font(.title)
                                .frame(width: 70, height: 70)
                                .background(Color.black.opacity(0.7))
                                .foregroundColor(.red)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    func buttonTapped(_ button: String) {
        if button == "C" {
            input = ""
        } else if button == "=" {
            input = evaluateExpression(input)
        } else {
            input.append(button)
        }
    }
    
    func evaluateExpression(_ expression: String) -> String {
        let exp: NSExpression = NSExpression(format: expression)
        if let result = exp.expressionValue(with: nil, context: nil) as? NSNumber {
            return result.stringValue
        }
        return "Error"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        calculetar()
    }
}


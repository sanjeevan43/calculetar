import SwiftUI

struct compoundInterest: View {
    @State private var principal: String = ""
    @State private var rate: String = ""
    @State private var time: String = ""
    @State private var amount: Double = 0.0
    @State private var interest: Double = 0.0
    
    var body: some View {
        VStack {
            Text("Compound Interest Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.black)
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.black, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(spacing: 15) {
                    inputField("Principal", $principal)
                    inputField("Rate (%)", $rate)
                    inputField("Time (yrs)", $time)
                    
                    HStack(spacing: 20) {
                        Button(action: calculateAmount) {
                            Text("Calculate")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 130, height: 50)
                                .background(Color.blue)
                                .cornerRadius(15)
                        }
                        
                        Button(action: resetFields) {
                            Text("Reset")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 130, height: 50)
                                .background(Color.gray)
                                .cornerRadius(15)
                        }
                    }
                    
                    infoBox("Amount", amount, .red)
                    infoBox("Interest", interest, .black)
                }
                .padding()
                .shadow(radius: 10)
            }
        }
    }
    
    private func calculateAmount() {
        let p = Double(principal) ?? 0
        let r = Double(rate) ?? 0
        let t = Double(time) ?? 0
        var a = 10
        var b = 10
        var amount : Double{
            a+=20
            return p * pow((1 + r / 100), t) + Double(a)
        }
        interest = amount - p
    }
    
//    private func calculateAmount() {
//        let p = Double(principal) ?? 0
//        let r = Double(rate) ?? 0
//        let t = Double(time) ?? 0
//        var a = 10
//        var b = 10
//        a += 20
//        amount = p * pow((1 + r / 100), t) + Double(a)
//        interest = amount - p
//    }

    
    
    private func resetFields() {
        principal = ""
        rate = ""
        time = ""
        amount = 0.0
        interest = 0.0
    }
    
    private func inputField(_ title: String, _ value: Binding<String>) -> some View {
        HStack {
            Text("\(title):")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            TextField("Enter \(title.lowercased())", text: value)
                .keyboardType(.decimalPad)
                .foregroundColor(.white)
                .background(Color.clear)
        }
        .padding()
        .frame(width: 300, height: 50)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(15)
    }
    
    private func infoBox(_ title: String, _ value: Double, _ color: Color) -> some View {
        HStack {
            Text("\(title):")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            Text("\(value, specifier: "%f")")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        .padding()
        .frame(width: 380, height: 50)
        .background(color)
        .cornerRadius(15)
        .shadow(color: color.opacity(0.7), radius: 5, x: 0, y: 5)
    }
}

#Preview {
    compoundInterest()
}

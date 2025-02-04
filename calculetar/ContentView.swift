import SwiftUI

struct ContentView: View {
    var body: some View {
        Link("Likitha", destination: URL(string: "https://www.apple.com")!)
            .font(.title)
            .foregroundColor(.blue)
    }
}

#Preview {
    ContentView()
}

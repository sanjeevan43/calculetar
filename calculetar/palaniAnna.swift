import SwiftUI
import AVFoundation

struct PalaniAnna: View {
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 0.5
    @State private var isPlaying = false
    var player: AVPlayer?
    
    init() {
        if let url = Bundle.main.url(forResource: "birthday_song", withExtension: "mp3") {
            player = AVPlayer(url: url)
        }
    }

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [.purple, .blue, .pink]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                // Animated Text
                Text("Happy Birthday Palani Anna 🎉")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .shadow(radius: 10)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                            scale = 1.2
                            opacity = 1.9
                        }
                    }
                
                            }
            
            ConfettiView()
        }
    }
}

// Confetti Effect
struct ConfettiView: View {
    @State private  var img : [String] = ["palaniAnna"]
    @State private var isAnimating = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<20, id: \.self) { i in
                    
                   //Image("Taj_Mahal")
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor([.red, .yellow, .blue, .green, .pink].randomElement()!)
                        .offset(x: CGFloat.random(in: -100...100), y: isAnimating ? geometry.size.height : -50)
                        .animation(Animation.easeOut(duration: Double.random(in: 2...4)).repeatForever(autoreverses: false), value: isAnimating)
                }
            }
            .onAppear {
                isAnimating = true
            }
        }
    }
}

#Preview {
    PalaniAnna()
}

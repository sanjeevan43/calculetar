import SwiftUI

struct Movie: View {
    @State private var buttonClicked = false
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 20) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    VStack {
                                        Image("mufasa")
                                            .resizable()
                                            .frame(width: 300, height: 200)
                                        
                                        
                                    }
                                    VStack {
                                        Image("Mapla Singam")
                                            .resizable()
                                            .frame(width: 300, height: 200)
                                    }
                                }
                                
                            }
                            .padding()
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                        VStack {
                                            Image("madhagaja")
                                                .resizable()
                                                .frame(width: 300, height: 200)
                                        }
                                    VStack {
                                        Image("magaraj")
                                            .resizable()
                                            .frame(width: 300, height: 200)
                                    }

                                    }
                                
                            .padding()
                        }
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                
                                        VStack {
                                            Image("bigil")
                                                .resizable()
                                                .frame(width: 300, height: 200)
                                        }
                                    VStack {
                                        Image("Call Me By Your Name")
                                            .resizable()
                                            .frame(width: 300, height: 200)
                                    }
                                    }
                                
                            
                            .padding()
                        }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

#Preview {
    Movie()
}

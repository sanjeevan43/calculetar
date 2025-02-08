import SwiftUI
struct Login_page: View {
    @State private var email = ""
    @State private var password = ""
    @State private var buttonClicked = false
    var body: some View {
        NavigationView {
            ZStack {
                Image("movie")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)                
                VStack {
                    Text("welcome to")
                        .font(.system(size: 65))
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.trailing)
                        .padding()
                        .offset(x: -20, y: 0)
                    
                    Text("movie king")
                        .font(.system(size: 65))
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .padding()
                        .offset(x: 45, y: -30)
                    
                    VStack {
                        Text("login your ID")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                            .padding()
                        
                        HStack {
                            Text("Email / Phone :")
                                .font(.title3)
                                .foregroundColor(Color.red)
                            TextField("Enter Email / phone", text: $email)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        HStack {
                            Text("Password : ")
                                .foregroundColor(Color.red)
                            SecureField("Enter password", text: $password)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        HStack {
                            Button {
                                print("OTP sent")
                                print(Int.random(in: 1111..<9999))
                            } label: {
                                Text("forgot password")
                                    .foregroundColor(Color.white)
                            }
                            .padding()
                        }

                        NavigationLink(destination: Movie()) {
                            Text("login")
                                .frame(width: 200, height: 50)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                    .frame(width: 310, height: 400)
                    .shadow(color: .white, radius: 0)
                    .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    Login_page()
}

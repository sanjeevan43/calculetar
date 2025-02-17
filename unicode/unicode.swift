import SwiftUI

struct UnicodeView: View {
    @State private var userInput: String = ""
    @State private var convertedText: String = ""
    @State private var conversionMode: ConversionMode = .englishToUnicode

    enum ConversionMode: String, CaseIterable {
        case unicodeToTamil = "Unicode → Tamil"
        case tamilToUnicode = "Tamil → Unicode"
        case englishToUnicode = "English → Unicode"
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Unicode Converter")
                .font(.title)
                .bold()

            Picker("Conversion Mode", selection: $conversionMode) {
                ForEach(ConversionMode.allCases, id: \.self) { mode in
                    Text(mode.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            // Input TextField
            TextField("Enter text...", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onChange(of: userInput) { _ in
                    convertedText = convert(userInput, mode: conversionMode)
                }

            // Output Label
            ScrollView {
                Text(convertedText)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.blue)
                    .padding()
            }
            .frame(height: 100)

            Spacer()
        }
        .padding()
    }
    
    func convert(_ text: String, mode: ConversionMode) -> String {
        switch mode {
        case .unicodeToTamil:
            return convertUnicodeToTamil(text)
        case .tamilToUnicode:
            return convertTamilToUnicode(text)
        case .englishToUnicode:
            return convertEnglishToUnicode(text)
        }
    }

    // Converts Unicode escape sequences to Tamil characters
    func convertUnicodeToTamil(_ unicodeString: String) -> String {
        let pattern = #"\\u\{([0-9A-Fa-f]+)\}"#
        
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return unicodeString
        }
        
        let nsString = unicodeString as NSString
        let matches = regex.matches(in: unicodeString, options: [], range: NSRange(location: 0, length: nsString.length))

        var result = unicodeString
        for match in matches.reversed() {
            if let range = Range(match.range(at: 1), in: unicodeString),
               let unicodeValue = UInt32(unicodeString[range], radix: 16),
               let scalar = UnicodeScalar(unicodeValue) {
                let unicodeCharacter = String(scalar)
                result = (result as NSString).replacingCharacters(in: match.range, with: unicodeCharacter)
            }
        }
        
        return result
    }

    // Converts Tamil characters to Unicode escape sequences
    func convertTamilToUnicode(_ tamilString: String) -> String {
        return tamilString.unicodeScalars.map { String(format: "\\u{%04X}", $0.value) }.joined()
    }

    func convertEnglishToUnicode(_ englishString: String) -> String {
        return englishString.unicodeScalars.map { String(format: "\\u{%04X}", $0.value) }.joined()
    }
}

struct UnicodeView_Previews: PreviewProvider {
    static var previews: some View {
        UnicodeView()
    }
}

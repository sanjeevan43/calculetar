import SwiftUI
struct Rectangle {
    var width: Double
    var height: Double
    
    // Computed property to calculate area
    var area: Double {
        return width * height
    }
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

struct RectangleView: View {
    var rectangle: Rectangle =  Rectangle(width: 100, height: 200)
    var count: Int = 10
    var body: some View {
        Text("Hello, World!")
        
    }
}

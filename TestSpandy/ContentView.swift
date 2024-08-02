import SwiftUI

struct ContentView: View {
    @State var isPaired: Bool = false
    @Environment(\.colorScheme) var colorScheme
    @State var Tab:String = "Person"
    var body: some View {
        if isPaired {
            let dateHolder = DateHolder()
            Home()
                .environmentObject(dateHolder)
                .background(Color.colorScheme)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        } else {
            ListView(isPaired: $isPaired)
        }
    }
}

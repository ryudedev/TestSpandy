import SwiftUI

@main
struct TestSpandyApp: App {
    let isPaired: Bool = true
    @Environment(\.colorScheme) var colorScheme
    @State var Tab:String = "Person"
    var body: some Scene {
        WindowGroup {
            if(isPaired) {
                let dateHolder = DateHolder()
                Home()
                    .environmentObject(dateHolder)
                    .background(Color.colorScheme)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            } else {
                ListView()
            }
        }
    }
}

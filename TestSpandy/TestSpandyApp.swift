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
                if Tab == "Setting" {
                    SettingView()
                        .environmentObject(dateHolder)
                        .background(Color.colorScheme)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                        .overlay(Navigation(Tab: Tab).environmentObject(dateHolder), alignment: .bottom)
                } else if Tab == "Chat" {
                    ChatView()
                        .environmentObject(dateHolder)
                        .background(Color.colorScheme)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                        .overlay(Navigation(Tab: Tab).environmentObject(dateHolder), alignment: .bottom)
                } else {
                    PairInfoView()
                        .environmentObject(dateHolder)
                        .background(Color.colorScheme)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                        .overlay(Navigation(Tab: Tab).environmentObject(dateHolder), alignment: .bottom)
                }
            } else {
                ListView()
            }
        }
    }
}

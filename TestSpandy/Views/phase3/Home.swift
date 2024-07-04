//
//  Home.swift
//  TestSpandy
//
//  Created by IT on 2024/06/25.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    //　現在の開いているタブインデックス
    @State var currentTab: Int = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentTab) {
                PairInfoView().environmentObject(dateHolder).tag(0)
                ChatView().environmentObject(dateHolder).tag(1)
                SettingsView().environmentObject(dateHolder).tag(2)
            }
            .frame(maxHeight: .infinity)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentTab)
            .background(Color.colorScheme)
            ButtonNavigation
        }
    }
}

#Preview {
    Home()
}

extension Home {
    private var ButtonNavigation: some View {
        HStack(alignment: .center)
        {
            Button {
                currentTab = 0
            } label: {
                Image("Person")
                    .frame(width: 50, height: 50, alignment: .center)
                    .toolbar(.hidden)
            }
            Spacer()
            Button {
                currentTab = 1
            } label: {
                Image("Chat")
                    .frame(width: 50, height: 50, alignment: .center)
                    .toolbar(.hidden)
            }
            Spacer()
            Button {
                currentTab = 2
            } label: {
                Image("Setting")
                    .frame(width: 50, height: 50, alignment: .center)
                    .toolbar(.hidden)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding(.horizontal)
        .background(Color.white)
    }
}

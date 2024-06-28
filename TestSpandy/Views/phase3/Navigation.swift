//
//  Navigation.swift
//  TestSpandy
//
//  Created by IT on 2024/06/25.
//

import SwiftUI

struct Navigation: View {
    @EnvironmentObject var dateHolder: DateHolder
    var Tab: String
    var body: some View {
        HStack(alignment: .center)
        {
            Button(action: {Tab = "Person"})
            {
                Image("Person")
                    .frame(width: 50, height: 50, alignment: .center)
                    .toolbar(.hidden)
            }
            Spacer()
            Button(action: {Tab = "Chat"})
            {
                Image("Chat")
                    .frame(width: 50, height: 50, alignment: .center)
                    .toolbar(.hidden)
            }
            Spacer()
            Button(action: {Tab = "Setting"})
            {
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

#Preview {
    Navigation()
}

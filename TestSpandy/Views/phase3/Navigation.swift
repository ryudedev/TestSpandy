//
//  Navigation.swift
//  TestSpandy
//
//  Created by IT on 2024/06/25.
//

import SwiftUI

struct Navigation: View {
    @EnvironmentObject var dateHolder: DateHolder
    var body: some View {
        HStack(alignment: .center)
        {
            NavigationLink {
                PairInfoView().environmentObject(dateHolder)
            } label: {
                Image("Person")
                    .frame(width: 50, height: 50, alignment: .center)
                    .toolbar(.hidden)
            }
            Spacer()
            NavigationLink {
                ChatView().environmentObject(dateHolder)
            } label: {
                Image("Chat")
                    .frame(width: 50, height: 50, alignment: .center)
                    .toolbar(.hidden)
            }
            Spacer()
            NavigationLink {
                
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

#Preview {
    Navigation()
}

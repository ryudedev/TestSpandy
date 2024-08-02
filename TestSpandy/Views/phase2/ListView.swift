//
//  ListView.swift
//  TestSpandy
//
//  Created by IT on 2024/06/14.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var uvm: UserViewModel = UserViewModel()
    @Binding var isPaired: Bool
    var body: some View {
        NavigationView {
            ZStack(){
                VStack {
                    list
                }
                NaviView()
            }
        }
    }
}

extension ListView {
    private var list: some View {
        ScrollView {
            VStack {
                ForEach(uvm.userData[0].users) { user in
                    CardView(user: user, isPaired: $isPaired)
                }
            }
        }
    }
}

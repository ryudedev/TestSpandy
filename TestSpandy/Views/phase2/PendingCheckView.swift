//
//  PendingCheckView.swift
//  TestSpandy
//
//  Created by IT on 2024/06/18.
//

import SwiftUI

struct PendingCheckView: View {
    let user: Person
    @Binding var isPaired: Bool
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 24) {
                VStack(alignment: .center, spacing: 14) {
                    Text("Pending")
                        .font(.custom("HiraKakuStd-W7", size: 20))
                    Text("awaiting...")
                        .font(.custom("HiraKakuStd-W7", size: 16))
                }
                CardView(user: user, isPaired: $isPaired)
            }
        }
    }
}

//#Preview {
//    PendingCheckView()
//}

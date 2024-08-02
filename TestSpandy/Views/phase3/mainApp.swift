//
//  mainApp.swift
//  TestSpandy
//
//  Created by IT on 2024/07/01.
//

import SwiftUI

struct mainApp: View {
    @EnvironmentObject var dateHolder: DateHolder
    var body: some View {
        NavigationView {
            PairInfoView()
                .environmentObject(dateHolder)
        }
    }
}

#Preview {
    mainApp()
}

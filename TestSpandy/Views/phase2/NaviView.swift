//
//  Navigation.swift
//  TestSpandy
//
//  Created by IT on 2024/06/16.
//

import SwiftUI

struct NaviView: View {
    
    // navigationのクリックフラグ
    @State private var is_click = false
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading, spacing: 16) {
                Spacer()
                if(is_click) {
                    VStack(alignment: .center) {
                        NavigationLink {
                            PendingView()
                                .toolbar(.hidden)
                        } label: {
                            Image("List")
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color.green600)
                        }
                    }
                    .padding([.horizontal, .vertical], 16)
                    .background(.white)
                    .cornerRadius(50)
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 0)
                    
                    VStack(alignment: .center) {
                        NavigationLink {
                            SettingView()
                                .toolbar(.hidden)
                        } label: {
                            Image(systemName: "gearshape")
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color.green600)
                        }
                    }
                    .padding([.horizontal, .vertical], 16)
                    .background(.white)
                    .cornerRadius(50)
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 0)
                    .frame(alignment: .center)
                    
                }
                VStack(alignment: .center) {
                    if(!is_click) {
                        Image("Hamburger")
                            .frame(width: 24, height: 24)
                    } else {
                        Image(systemName: "xmark")
                            .renderingMode(.template)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.white)
                    }
                }
                .padding([.horizontal, .vertical], 16)
                .background(Color.green600)
                .cornerRadius(50)
                .onTapGesture {
                    is_click = !is_click
                }
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16.0, trailing: 16.0))
        }
    }
}

#Preview {
    NaviView()
}

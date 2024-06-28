//
//  Carrer.swift
//  TestSpandy
//
//  Created by IT on 2024/06/18.
//

import SwiftUI

struct CarrerView: View {
    let carrers: [Carrer]
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(alignment: .center) {
            Text("carrer")
                .font(.custom("HiraKakuStd-W7", size: 14))
                .foregroundStyle(Color.grey300)
                .padding(.bottom)
            VStack(alignment: .leading, spacing: 20) {
                ForEach(carrers) { car in
                    VStack(alignment: .leading) {
                        Text(car.date)
                            .font(.custom("HiraKakuStd-W7", size: 12))
                            .foregroundStyle(Color.grey300)
                        Text(car.name)
                            .font(.custom("HiraKakuStd-W7", size: 16))
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    Divider()
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
        .padding()
        .padding(.top, 72)
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
        .overlay(header, alignment: .top)
    }
}

#Preview {
    CarrerView(carrers: [
        Carrer(
            date: "Jun 2009",
            name: "Enters Kindergarten"
        ),
        Carrer(
            date: "Aug 2009",
            name: "Enters 1st Grade"
        ),
        Carrer(
            date: "June 2014",
            name: "Completes 5th Grade"
        )
    ])
}

extension CarrerView {
    private var header: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color.black)
            }
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
        .padding()
    }
}

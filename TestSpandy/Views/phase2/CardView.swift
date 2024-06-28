//
//  Card.swift
//  SwiftUIApp
//
//  Created by IT on 2024/06/10.
//

import SwiftUI
import WrappingStack

struct CardView: View {
    let user: Person
    let qualificationData: [String] = ["TOEIC", "German Language Proficiency Test", "Chinese Language Proficiency Test"]
    let languageData: [String] = ["English","French", "Italian", "Arabic", "chinese"]
    @State private var is_open = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
            VStack(alignment: .leading, spacing: 24) {
                cardBody
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 350, height: 1)
                    .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                qualification
                language
            }
            .padding(.horizontal, 0)
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(Color.white)
            .cornerRadius(24)
            .shadow(color: Color(red: 0.31, green: 0.31, blue: 0.31).opacity(0.25), radius: 5, x: 0, y: -8)
        }
        .padding(0)
        .frame(width: 350, alignment: .topLeading)
        .background(Color(red: 0, green: 0.66, blue: 0.38))
        .cornerRadius(24)
        .onTapGesture {
            is_open = !is_open
        }
    }
}

//#Preview {
//    Card()
//}

extension CardView {
    private var header: some View {
        VStack(alignment: .center, spacing: 16) {
            HStack(alignment: .center, spacing: 44) {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80)
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(user.first_name) \(user.last_name)")
                        .font(Font.custom("HiraKakuStd-W7", size: 20))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    Text("age \(user.age)")
                        .font(Font.custom("HiraKakuStd-W7", size: 12))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                .padding(0)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 0, green: 0.66, blue: 0.38))
            Button {
                
            } label: {
                HStack(alignment: .center, spacing: 8) {
                    Image("ApplyFor")
                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color.green600)
                    Text("Apply For")
                        .font(.custom("HiraKakuStd-W7", size: 12))
                        .foregroundStyle(Color.green600)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
            .padding([.vertical], 8)
            .background(Color.white)
            .cornerRadius(50)
        }
        .padding([.horizontal, .vertical], 24)
    }
    
    private var cardBody: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("SelfPR")
              .font(Font.custom("HiraKakuStd-W7", size: 24))
              .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
            if(!is_open) {
                Text(user.selfPR)
                    .font(Font.custom("HiraKakuStd-W7", size: 14))
                    .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                    .truncationMode(.tail)
                    .lineLimit(4)
            } else {
                Text(user.selfPR)
                    .font(Font.custom("HiraKakuStd-W7", size: 14))
                    .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
            }
        }
            .padding(.horizontal, 24)
            .padding(.vertical, 0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    
    private var qualification: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Qualifications")
                .font(Font.custom("HiraKakuStd-W7", size: 20))
                .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
            if(!is_open) {
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 12) {
                        ForEach(qualificationData, id: \.self) { qua in
                            HStack(alignment: .center, spacing: 10) {
                                Text(qua)
                                    .font(Font.custom("HiraKakuStd-W7", size: 12))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 4)
                            .background(Color(red: 0.98, green: 0.52, blue: 0.44))
                            .cornerRadius(50)
                        }
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
            } else {
                WrappingHStack(id: \.self, alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
                    ForEach(qualificationData, id: \.self) { qua in
                        HStack(alignment: .center, spacing: 10) {
                            Text(qua)
                                .font(Font.custom("HiraKakuStd-W7", size: 12))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 4)
                        .background(Color(red: 0.98, green: 0.52, blue: 0.44))
                        .cornerRadius(50)
                    }
                }
                .padding(0)
            }
        }
            .padding(.horizontal, 24)
            .padding(.vertical, 0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    
    private var language: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Language")
              .font(Font.custom("HiraKakuStd-W7", size: 20))
              .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
            if(!is_open) {
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 12) {
                        ForEach(languageData, id: \.self) { lan in
                            HStack(alignment: .center, spacing: 10) {
                                Text(lan)
                                  .font(Font.custom("HiraKakuStd-W7", size: 12))
                                  .foregroundColor(.white)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 4)
                            .background(Color(red: 0.98, green: 0.52, blue: 0.44))
                            .cornerRadius(50)
                        }
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
            } else {
                WrappingHStack(id: \.self, alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
                    ForEach(languageData, id: \.self) { lan in
                        HStack(alignment: .center, spacing: 10) {
                            Text(lan)
                              .font(Font.custom("HiraKakuStd-W7", size: 12))
                              .foregroundColor(.white)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 4)
                        .background(Color(red: 0.98, green: 0.52, blue: 0.44))
                        .cornerRadius(50)
                    }
                }
                .padding(0)
            }
            
        }
            .padding(.horizontal, 24)
            .padding(.vertical, 0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

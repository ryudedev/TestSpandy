//
//  Setting.swift
//  TestSpandy
//
//  Created by IT on 2024/06/17.
//

import SwiftUI
import WrappingStack

struct SettingView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isPresented: Bool = false
    let qualificationData: [String] = ["TOEIC", "German Language Proficiency Test", "Chinese Language Proficiency Test"]
    let languageData: [String] = ["English","French", "Italian", "Arabic", "chinese"]
    
    let carrers: [Carrer] = [
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
    ]

    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                profileHeader
                profileCarrer
                Divider()
                birthday
                    .padding(.bottom)
                HStack {
                    height
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                    weight
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.bottom)
                selfpr
                    .padding(.bottom)
                qualification
                    .padding(.bottom)
                language
                    .padding(.bottom)
                Spacer()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .padding()
            .padding(.top, 72)
        }
        .overlay(header, alignment: .top)
    }
}

#Preview {
    SettingView()
}

extension SettingView {
    private var header: some View {
        HStack(alignment: .center) {
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.backward")
                    .renderingMode(.template)
                    .font(.title2)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.black)
            }
            Spacer()
            
            Image("Edit")
                .frame(width: 24, height: 24)
        }
        .padding()
        .background(.white)
    }
    
    private var profileHeader: some View {
        HStack(alignment: .center, spacing: 24) {
            HStack() {
                Image(systemName: "person.fill")
                    .font(.largeTitle)
                    .frame(width: 105, height: 105)
            }
            .background(.white)
            .cornerRadius(8.0)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            VStack(alignment: .leading) {
                HStack{
                    Image("UnitedStates")
                    Text("Supporter")
                        .foregroundStyle(Color.grey300)
                        .fontWeight(.bold)
                }
                HStack{
                    Text("Michelle")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Rose")
                        .font(.title)
                        .fontWeight(.bold)
                }
                HStack {
                    Text(verbatim: "michelle.rose@gmail.com")
                        .foregroundStyle(Color.grey300)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom)
    }
    
    private var profileCarrer: some View {
        VStack(alignment: .leading) {
            HStack() {
                Spacer()
                HStack {
                    Button(action: {
                        isPresented = true //trueにしないと画面遷移されない
                    }) {
                        Text("Details")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Image(systemName: "chevron.right")
                            .font(.title2)
                    }
                    .fullScreenCover(isPresented: $isPresented) {
                        CarrerView(carrers: carrers)
                    }
                }
                .foregroundStyle(Color.green600)
            }
            VStack(alignment: .center) {
                ForEach(carrers) { carrer in
                    HStack(alignment: .center) {
                        Text(carrer.date)
                            .font(.system(size: 12))
                            .foregroundStyle(Color.grey300)
                        Spacer()
                        Text(carrer.name)
                        Spacer()
                    }
                    .padding(.bottom)
                }
            }
        }
    }
    
    private var birthday: some View {
        VStack(alignment: .leading) {
            Text("Birthday")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("June 11, 1999")
        }
    }
    
    private var height: some View {
        VStack(alignment: .leading) {
            Text("Height")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("165.8cm")
        }
    }
    
    private var weight: some View {
        VStack(alignment: .leading) {
            Text("Weight")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("56.4kg")
        }
    }
    
    private var selfpr: some View {
        VStack(alignment: .leading) {
            Text("SelfPR")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("As Chris Evans, I strive to balance my public persona as an actor with my personal interests and passions. Known for my role as Captain America in the Marvel Cinematic Universe, I participate in various promotional activities for my movies, including interviews, conventions, and fan events. Beyond acting, I am active on social media, particularly Twitter, where I engage with fans and share my thoughts on current events and social issues. Authenticity and relatability are key components of my PR strategy, allowing me to connect with a broad audience.")
        }
    }
    
    private var qualification: some View {
        VStack(alignment: .leading) {
            Text("Qualification")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            WrappingHStack(id: \.self, alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
                ForEach(qualificationData, id: \.self) { qua in
                    HStack(alignment: .center, spacing: 10) {
                        Text(qua)
                            .font(Font.custom("Hiragino Sans", size: 12))
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
    
    private var language: some View {
        VStack(alignment: .leading) {
            Text("Language")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            WrappingHStack(id: \.self, alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
                ForEach(languageData, id: \.self) { lan in
                    HStack(alignment: .center, spacing: 10) {
                        Text(lan)
                            .font(Font.custom("Hiragino Sans", size: 12))
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
}

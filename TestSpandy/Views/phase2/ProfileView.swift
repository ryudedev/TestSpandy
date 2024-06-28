//
//  Profile.swift
//  TestSpandy
//
//  Created by IT on 2024/06/16.
//

import SwiftUI
import WrappingStack

struct ProfileView: View {
    let user: Person
    let qualificationData: [String] = ["TOEIC", "German Language Proficiency Test", "Chinese Language Proficiency Test"]
    let languageData: [String] = ["English","French", "Italian", "Arabic", "chinese"]
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                header
                VStack(alignment: .leading, spacing: 24) {
                    cardBody
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
            .frame(width: 350, alignment: .top)
            .background(Color(red: 0, green: 0.66, blue: 0.38))
            .cornerRadius(24)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
        .padding(.top, 72)
        .overlay(navigationArea, alignment: .top)
    }
}

#Preview {
    ProfileView(user: Person(
        id: "1a23b4c5-d6e7-48f9-a9b0-8e19b9e1f43e",
        first_name: "Scarlett",
        last_name: "Johansson",
        age: 39,
        password: "5fj20k2f8fj28fnslf9",
        email: "scarlettjohansson@example.com",
        gender: 0,
        birthday: "1984-11-22",
        nationality: "United States",
        selfPR: "As Scarlett Johansson, my public relations efforts focus on my diverse acting career and advocacy for women's rights. From my roles in blockbuster films like Black Widow to independent movies, I maintain a strong presence in the entertainment industry. My PR approach includes engaging with fans on social media, participating in interviews, and supporting charitable causes. I aim to project a positive and empowered image, inspiring others through my work and public persona.",
        special_note: "",
        carrer_id: "5",
        height: 160,
        weight: 57,
        is_supporter: true,
        paire_id: "de56fgh7-8901-2345-e67f-g8h9i0j1k2l3",
        created_at: "2023-02-04 13:00:00",
        updated_at: "2023-02-04 13:00:00"))
}

extension ProfileView {
    private var header: some View {
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
                    .font(Font.custom("Hiragino Sans", size: 12))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            .padding(0)
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 0, green: 0.66, blue: 0.38))
    }
    
    private var cardBody: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("SelfPR")
                .font(Font.custom("Hiragino Sans", size: 24))
                .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
            Text(user.selfPR)
                .font(Font.custom("Hiragino Sans", size: 14))
                .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                .truncationMode(.tail)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 0)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    
    private var qualification: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Qualifications")
                .font(Font.custom("Hiragino Sans", size: 20))
                .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
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
        .padding(.horizontal, 24)
        .padding(.vertical, 0)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    
    private var language: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Language")
                .font(Font.custom("Hiragino Sans", size: 20))
                .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
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
        .padding(.horizontal, 24)
        .padding(.vertical, 0)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    
    private var navigationArea: some View {
        HStack(alignment: .center) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.backward")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            Spacer()
        }
        .background(Color.white)
        .frame(maxWidth: .infinity)
        .padding()
    }
}

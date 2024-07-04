//
//  Settings.swift
//  TestSpandy
//
//  Created by IT on 2024/07/04.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var dateHolder: DateHolder
    @State var currentUser: Person = Person(
        id: "0",
        first_name: "",
        last_name: "",
        age: 0,
        password: "",
        email: "",
        gender: 0,
        birthday: "",
        nationality: "",
        selfPR: "",
        special_note: "",
        carrer_id: "",
        height: 0,
        weight: 0,
        is_supporter: true,
        paire_id: "",
        created_at: "",
        updated_at: ""
    )
    @State private var genderSheet = false
    @State private var presentationDetent = PresentationDetent.medium
    
    var body: some View {
        VStack(alignment: .leading) {
            profileCard
            EditField
        }
        .frame(maxHeight: .infinity)
    }
}

//#Preview {
//    SettingsView()
//}

extension SettingsView {
    private var profileCard: some View {
        HStack(alignment: .center, spacing: 23) {
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: 105, height: 105)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment:.top ,spacing: 16) {
                    Image("UnitedStates")
                    Text(currentUser.is_supporter ? "Supporter" : "BodyGuard")
                        .foregroundColor(.grey300)
                }
                VStack(alignment: .leading,spacing: 8) {
                    Text(currentUser.first_name + currentUser.last_name)
                        .font(.custom("HiraKakuStd-w7", size: 24))
                    Text(currentUser.email)
                        .font(.custom("HiraKakuStd-w7", size: 12))
                        .foregroundColor(.grey300)
                }
            }
            Spacer()
        }
        .padding()
    }
    
    private var EditField: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("MySelf")
                    .font(.custom("HiraKakuStd-w7", size: 20))
                    .padding(.leading)
                VStack(alignment: .leading, spacing: 0) {
                    Divider()
                    VStack(alignment: .leading ,spacing: 0) {
                        HStack(alignment: .center) {
                            Image("EditChat")
                                .renderingMode(.template)
                                .foregroundColor(.grey300)
                            TextField("Gender  Pronoun", text: $currentUser.gender)
                        }
                        .padding(.vertical)
                        Divider()
                        HStack(alignment: .center) {
                            Image("EditCalendar")
                                .renderingMode(.template)
                                .foregroundColor(.grey300)
                            TextField("Birthday", text: $sample)
                        }
                        .padding(.vertical)
                        Divider()
                        HStack(alignment: .center) {
                            Image("EditLanguage")
                                .renderingMode(.template)
                                .foregroundColor(.grey300)
                            TextField("Languages Spoken", text: $sample)
                        }
                        .padding(.vertical)
                        Divider()
                        HStack(alignment: .center) {
                            Image("EditQualification")
                                .renderingMode(.template)
                                .foregroundColor(.grey300)
                            TextField("Qualification", text: $sample)
                        }
                        .padding(.vertical)
                        Divider()
                        HStack(alignment: .center) {
                            Image("EditHeight")
                                .renderingMode(.template)
                                .foregroundColor(.grey300)
                            TextField("Height", text: $sample)
                        }
                        .padding(.vertical)
                        Divider()
                        HStack(alignment: .center) {
                            Image("EditWeight")
                                .renderingMode(.template)
                                .foregroundColor(.grey300)
                            TextField("Weight", text: $sample)
                        }
                        .padding(.vertical)
                    }
                    .padding(.horizontal)
                    Divider()
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("SelfPR")
                    .font(.custom("HiraKakuStd-w7", size: 20))
                    .padding(.leading)
                VStack(alignment: .leading, spacing: 0) {
                    Divider()
                    HStack(alignment: .center) {
                        TextField("Describe your self-promotion.", text: $sample)
                    }
                    .padding()
                    Divider()
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
            }
        }
    }
}

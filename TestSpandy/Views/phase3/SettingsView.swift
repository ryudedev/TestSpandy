//
//  SettingsView.swift
//  TestSpandy
//
//  Created by IT on 2024/07/04.
//

import SwiftUI
import WrappingStack
import Algorithms

struct SettingsView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    @State var currentUser: Person
    
    // 送信するデータを保管する変数
    @State private var changeUser: InputPerson = InputPerson(gender: [], birthday: Date(), language: [], qualification: [], selfPR: "", height: 0, weight: 0)
    
    // 各フィールドのシートの開閉の状態管理
    @State private var genderSheet = false
    @State private var languageSheet = false
    @State private var qualificationSheet = false
    
    // シートの大きさ
    @State private var presentationDetent = PresentationDetent.medium
    
    // 洗濯しているもののフラグ
    @State private var isGenderPronoun: [Bool]
    @State private var isLanguagePronoun: [Bool]
    @State private var isQualificationPronoun: [Bool]
    @State var date = Date()
    
    private var genderPronoun: [String] = [
        "He", "His", "Him", "She", "Her", "They", "Their", "Them"]
    private var languagePronoun: [String] = [
        "Japanese",
        "English",
        "Spanish",
        "French",
        "German",
        "Chinese",
        "Korean",
        "Russian",
        "Italian",
        "Portuguese",
        "Arabic",
        "Hindi"
    ]
    private var qualificationPronoun: [String] = [
        "CISSP",
        "PMP",
        "CCNA",
        "CPA",
        "CFA",
        "IELTS",
        "TOEFL",
        "GRE",
        "GMAT",
        "IGCSE",
        "IB",
        "Six Sigma",
        "Microsoft Azure Fundamentals",
        "AWS Solutions Architect",
        "CSM",
        "PRINCE2",
        "OCP",
        "CompTIA A+",
        "CompTIA Security+"
    ]
    
    public init(currentUser: Person) {
        self._currentUser = State(initialValue: currentUser)
        self._isGenderPronoun = State(initialValue: Array(repeating: false, count: genderPronoun.count))
        self._isLanguagePronoun = State(initialValue: Array(repeating: false, count: languagePronoun.count))
        self._isQualificationPronoun = State(initialValue: Array(repeating: false, count: qualificationPronoun.count))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            profileCard
            editField
        }
        .frame(maxHeight: .infinity)
    }
}

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
    
    private var editField: some View {
        VStack(spacing: 24) {
            myselfField
            selfprField
        }
    }
    
    private var myselfField: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("MySelf")
                .font(.custom("HiraKakuStd-w7", size: 20))
                .padding(.leading)
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                VStack(alignment: .leading ,spacing: 0) {
                    
                    // Gender Pronoun Field
                    Button {
                        genderSheet.toggle()
                    } label: {
                        Image("EditChat")
                            .renderingMode(.template)
                            .foregroundColor(.grey300)
                        Text("Gender Pronoun")
                            .foregroundColor(.grey300)
                    }
                    .sheet(isPresented: $genderSheet) {
                        NavigationStack {
                            HStack {
                                Text("Gender Pronoun")
                                    .font(.custom("HiraKakuStd-w7", size: 24))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom)
                                Spacer()
                                Text("\(changeUser.gender.count)/3")
                                    .font(.custom("HiraKakuStd-w7", size: 12))
                                    .foregroundColor(.grey200)
                            }
                            WrappingHStack(id: \.element, alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
                                ForEach(genderPronoun.indexed(), id: \.element) { index, gender in
                                    Button {
                                        if changeUser.gender.count < 3 {
                                            // 2つ以下なら追加
                                            if !changeUser.gender.contains(gender) { // gender (String) でチェック
                                                changeUser.gender.append(gender) // gender (String) を追加
                                                isGenderPronoun[index] = true
                                            } else if let indexToRemove = changeUser.gender.firstIndex(of: gender) {
                                                changeUser.gender.remove(at: indexToRemove)
                                                isGenderPronoun[index] = false
                                            }
                                        } else {
                                            // 3つ以上なら削除
                                            if let indexToRemove = changeUser.gender.firstIndex(of: gender) { // gender (String) で検索
                                                changeUser.gender.remove(at: indexToRemove)
                                                isGenderPronoun[index] = false
                                            }
                                        }
                                    } label: {
                                        styledButton(text: gender, isActive: isGenderPronoun[index])
                                    }
                                    .background(isGenderPronoun[index] ? Color.vermilion400 : Color.white)
                                    .cornerRadius(50)
                                }
                            }
                            .toolbar {
                                Button("Close", role: .cancel){
                                    genderSheet.toggle()
                                }
                            }
                            Spacer()
                        }
                        .presentationDetents(
                            [.medium, .large], selection: $presentationDetent
                        )
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                    Divider()
                    
                    // Birthday Field
                    DatePicker(selection: $changeUser.birthday, displayedComponents: .date) {
                        HStack {
                            Image("EditCalendar")
                                .renderingMode(.template)
                                .foregroundColor(.grey300)
                            Text("Birthday")
                                .foregroundColor(.grey300)
                        }
                    }
                    .padding(.vertical)
                    
                    Divider()
                    
                    // Language Field
                    Button {
                        languageSheet.toggle()
                    } label: {
                        Image("EditLanguage")
                            .renderingMode(.template)
                            .foregroundColor(.grey300)
                        Text("Languages Spoken")
                            .foregroundColor(.grey300)
                    }
                    .sheet(isPresented: $languageSheet) {
                        NavigationStack {
                            Text("Languages Spoken")
                                .font(.custom("HiraKakuStd-w7", size: 24))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom)
                            WrappingHStack(id: \.element, alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
                                ForEach(languagePronoun.indexed(), id: \.element) { index, language in
                                    Button {
                                        changeUser.language.append(language)
                                        isLanguagePronoun[index] = !isLanguagePronoun[index]
                                    } label: {
                                        styledButton(text: language, isActive: isLanguagePronoun[index])
                                    }
                                    .background(isLanguagePronoun[index] ? Color.vermilion400 : Color.white)
                                    .cornerRadius(50)
                                }
                            }
                            .toolbar {
                                Button("Close", role: .cancel){
                                    languageSheet.toggle()
                                }
                            }
                            Spacer()
                        }
                        .presentationDetents(
                            [.medium, .large], selection: $presentationDetent
                        )
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                    Divider()
                    
                    // Qualification Field
                    Button {
                        qualificationSheet.toggle()
                    } label: {
                        Image("EditQualification")
                            .renderingMode(.template)
                            .foregroundColor(.grey300)
                        Text("Qualification")
                            .foregroundColor(.grey300)
                    }
                    .sheet(isPresented: $qualificationSheet) {
                        NavigationStack {
                            Text("Qualification")
                                .font(.custom("HiraKakuStd-w7", size: 24))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom)
                            WrappingHStack(id: \.element, alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
                                ForEach(qualificationPronoun.indexed(), id: \.element) { index, qualification in
                                    Button {
                                        changeUser.qualification.append(qualification)
                                        isQualificationPronoun[index] = !isQualificationPronoun[index]
                                    } label: {
                                        styledButton(text: qualification, isActive: isQualificationPronoun[index])
                                    }
                                    .background(isQualificationPronoun[index] ? Color.vermilion400 : Color.white)
                                    .cornerRadius(50)
                                }
                            }
                            .toolbar {
                                Button("Close", role: .cancel){
                                    qualificationSheet.toggle()
                                }
                            }
                            Spacer()
                        }
                        .presentationDetents(
                            [.medium, .large], selection: $presentationDetent
                        )
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                    Divider()
                    
                    // Height Field
                    HStack(alignment: .center) {
                        Image("EditHeight")
                            .renderingMode(.template)
                            .foregroundColor(.grey300)
                        TextField("Height", value: $changeUser.height, format: .number)
                    }
                    .padding(.vertical)
                    Divider()
                    
                    // Weight Field
                    HStack(alignment: .center) {
                        Image("EditWeight")
                            .renderingMode(.template)
                            .foregroundColor(.grey300)
                        TextField("Weight", value: $changeUser.weight, format: .number)
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
                Divider()
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
    }
    
    private var selfprField: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("SelfPR")
                .font(.custom("HiraKakuStd-w7", size: 20))
                .padding(.leading)
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                HStack(alignment: .center) {
                    TextField("Describe your self-promotion.", text: $changeUser.selfPR)
                }
                .padding()
                Divider()
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
    }
    
    func styledButton(text: String, isActive: Bool) -> some View {
        Text(text)
            .font(.custom("HiraKakuStd-w7", size: 12))
            .foregroundColor(isActive ? .white : .grey300)
            .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isActive ? Color.vermilion400 : Color.grey500, lineWidth: 1)
            )
    }
}

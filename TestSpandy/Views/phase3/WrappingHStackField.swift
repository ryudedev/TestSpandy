//
//  Settings.swift
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
    
    @State private var changeUser: InputPerson = InputPerson(gender: [], birthday: Date(), language: [], qualification: [], selfPR: "", height: 0, weight: 0)
    
    @State private var genderSheet = false
    @State private var languageSheet = false
    @State private var qualificationSheet = false
    
    @State private var presentationDetent = PresentationDetent.medium
    
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
    
    private var profileCard: some View {
        ProfileCardView(currentUser: currentUser)
    }
    
    private var editField: some View {
        EditFieldView(
            changeUser: $changeUser,
            genderSheet: $genderSheet,
            languageSheet: $languageSheet,
            qualificationSheet: $qualificationSheet,
            presentationDetent: $presentationDetent,
            isGenderPronoun: $isGenderPronoun,
            isLanguagePronoun: $isLanguagePronoun,
            isQualificationPronoun: $isQualificationPronoun,
            genderPronoun: genderPronoun,
            languagePronoun: languagePronoun,
            qualificationPronoun: qualificationPronoun
        )
    }
}

struct ProfileCardView: View {
    var currentUser: Person
    
    var body: some View {
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
}

struct EditFieldView: View {
    @Binding var changeUser: InputPerson
    @Binding var genderSheet: Bool
    @Binding var languageSheet: Bool
    @Binding var qualificationSheet: Bool
    @Binding var presentationDetent: PresentationDetent
    
    @Binding var isGenderPronoun: [Bool]
    @Binding var isLanguagePronoun: [Bool]
    @Binding var isQualificationPronoun: [Bool]
    
    var genderPronoun: [String]
    var languagePronoun: [String]
    var qualificationPronoun: [String]
    
    var body: some View {
        VStack(spacing: 24) {
            MyselfFieldView(
                changeUser: $changeUser,
                genderSheet: $genderSheet,
                languageSheet: $languageSheet,
                qualificationSheet: $qualificationSheet,
                presentationDetent: $presentationDetent,
                isGenderPronoun: $isGenderPronoun,
                isLanguagePronoun: $isLanguagePronoun,
                isQualificationPronoun: $isQualificationPronoun,
                genderPronoun: genderPronoun,
                languagePronoun: languagePronoun,
                qualificationPronoun: qualificationPronoun
            )
            SelfPRFieldView(changeUser: $changeUser)
        }
    }
}

struct MyselfFieldView: View {
    @Binding var changeUser: InputPerson
    @Binding var genderSheet: Bool
    @Binding var languageSheet: Bool
    @Binding var qualificationSheet: Bool
    @Binding var presentationDetent: PresentationDetent
    
    @Binding var isGenderPronoun: [Bool]
    @Binding var isLanguagePronoun: [Bool]
    @Binding var isQualificationPronoun: [Bool]
    
    var genderPronoun: [String]
    var languagePronoun: [String]
    var qualificationPronoun: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("MySelf")
                .font(.custom("HiraKakuStd-w7", size: 20))
                .padding(.leading)
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                VStack(alignment: .leading, spacing: 0) {
                    genderPronounField
                    Divider()
                    birthdayField
                    Divider()
                    languageField
                    Divider()
                    qualificationField
                    Divider()
                    heightField
                    Divider()
                    weightField
                }
                .padding(.horizontal)
                Divider()
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
    }
    
    private var genderPronounField: some View {
        Button {
            genderSheet.toggle()
        } label: {
            HStack {
                Image("EditChat")
                    .renderingMode(.template)
                    .foregroundColor(.grey300)
                Text("Gender Pronoun")
                    .foregroundColor(.grey300)
            }
        }
        .sheet(isPresented: $genderSheet) {
            GenderPronounSheetView(
                changeUser: $changeUser,
                genderSheet: $genderSheet,
                presentationDetent: $presentationDetent,
                isGenderPronoun: $isGenderPronoun,
                genderPronoun: genderPronoun
            )
        }
        .padding(.vertical)
    }
    
    private var birthdayField: some View {
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
    }
    
    private var languageField: some View {
        Button {
            languageSheet.toggle()
        } label: {
            HStack {
                Image("EditLanguage")
                    .renderingMode(.template)
                    .foregroundColor(.grey300)
                Text("Languages Spoken")
                    .foregroundColor(.grey300)
            }
        }
        .sheet(isPresented: $languageSheet) {
            LanguageSheetView(
                changeUser: $changeUser,
                languageSheet: $languageSheet,
                presentationDetent: $presentationDetent,
                isLanguagePronoun: $isLanguagePronoun,
                languagePronoun: languagePronoun
            )
        }
        .padding(.vertical)
    }
    
    private var qualificationField: some View {
        Button {
            qualificationSheet.toggle()
        } label: {
            HStack {
                Image("EditQualification")
                    .renderingMode(.template)
                    .foregroundColor(.grey300)
                Text("Qualification")
                    .foregroundColor(.grey300)
            }
        }
        .sheet(isPresented: $qualificationSheet) {
            QualificationSheetView(
                changeUser: $changeUser,
                qualificationSheet: $qualificationSheet,
                presentationDetent: $presentationDetent,
                isQualificationPronoun: $isQualificationPronoun,
                qualificationPronoun: qualificationPronoun
            )
        }
        .padding(.vertical)
    }
    
    private var heightField: some View {
        HStack(alignment: .center) {
            Image("EditHeight")
                .renderingMode(.template)
                .foregroundColor(.grey300)
            TextField("Height", value: $changeUser.height, format: .number)
        }
        .padding(.vertical)
    }
    
    private var weightField: some View {
        HStack(alignment: .center) {
            Image("EditWeight")
                .renderingMode(.template)
                .foregroundColor(.grey300)
            TextField("Weight", value: $changeUser.weight, format: .number)
        }
        .padding(.vertical)
    }
}

struct SelfPRFieldView: View {
    @Binding var changeUser: InputPerson
    
    var body: some View {
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
}

struct GenderPronounSheetView: View {
    @Binding var changeUser: InputPerson
    @Binding var genderSheet: Bool
    @Binding var presentationDetent: PresentationDetent
    @Binding var isGenderPronoun: [Bool]
    
    var genderPronoun: [String]
    
    var body: some View {
        NavigationStack {
            Text("Gender Pronoun")
                .font(.custom("HiraKakuStd-w7", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            WrappingHStack(id: \.element, alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
                ForEach(genderPronoun.indexed(), id: \.element) { index, gender in
                    Button {
                        if changeUser.gender.count < 3 {
                            changeUser.gender.append(index)
                            isGenderPronoun[index] = !isGenderPronoun[index]
                        }
                    } label: {
                        Text(gender)
                            .font(.custom("HiraKakuStd-w7", size: 12))
                            .foregroundColor(isGenderPronoun[index] ? .white : .grey300)
                            .padding(EdgeInsets(
                                top: 4,         // 上の余白
                                leading: 16,    // 左の余白
                                bottom: 4,      // 下の余白
                                trailing: 16    // 右の余白
                            ))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(isGenderPronoun[index] ? Color.vermilion400 : Color.grey500, lineWidth: 1)
                            )
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
}

struct LanguageSheetView: View {
    @Binding var changeUser: InputPerson
    @Binding var languageSheet: Bool
    @Binding var presentationDetent: PresentationDetent
    @Binding var isLanguagePronoun: [Bool]
    
    var languagePronoun: [String]
    
    var body: some View {
        NavigationStack {
            Text("Languages Spoken")
                .font(.custom("HiraKakuStd-w7", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            WrappingHStack(id: \.element, alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
                ForEach(languagePronoun.indexed(), id: \.element) { index, language in
                    Button {
                        changeUser.language.append(index)
                        isLanguagePronoun[index] = !isLanguagePronoun[index]
                    } label: {
                        Text(language)
                            .font(.custom("HiraKakuStd-w7", size: 12))
                            .foregroundColor(isLanguagePronoun[index] ? .white : .grey300)
                            .padding(EdgeInsets(
                                top: 4,         // 上の余白
                                leading: 16,    // 左の余白
                                bottom: 4,      // 下の余白
                                trailing: 16    // 右の余白
                            ))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(isLanguagePronoun[index] ? Color.vermilion400 : Color.grey500, lineWidth: 1)
                            )
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
}

struct QualificationSheetView: View {
    @Binding var changeUser: InputPerson
    @Binding var qualificationSheet: Bool
    @Binding var presentationDetent: PresentationDetent
    @Binding var isQualificationPronoun: [Bool]
    
    var qualificationPronoun: [String]
    
    var body: some View {
        NavigationStack {
            Text("Qualification")
                .font(.custom("HiraKakuStd-w7", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            WrappingHStack(id: \.element, alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
                ForEach(qualificationPronoun.indexed(), id: \.element) { index, qualification in
                    Button {
                        changeUser.qualification.append(index)
                        isQualificationPronoun[index] = !isQualificationPronoun[index]
                    } label: {
                        Text(qualification)
                            .font(.custom("HiraKakuStd-w7", size: 12))
                            .foregroundColor(isQualificationPronoun[index] ? .white : .grey300)
                            .padding(EdgeInsets(
                                top: 4,         // 上の余白
                                leading: 16,    // 左の余白
                                bottom: 4,      // 下の余白
                                trailing: 16    // 右の余白
                            ))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(isQualificationPronoun[index] ? Color.vermilion400 : Color.grey500, lineWidth: 1)
                            )
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
}

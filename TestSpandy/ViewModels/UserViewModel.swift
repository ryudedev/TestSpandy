//
//  UserViewModel.swift
//  TestSpandy
//
//  Created by IT on 2024/06/16.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var userData: [User] = []
    
    init() {
        userData = fetchUserData()
    }
    
    private func fetchUserData() -> [User] {
        let fileName = "userData.json"
        let data: Data
        
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: nil)
        else {
            fatalError("\(fileName)が見つかりませんでした")
        }
        
        do {
            data = try Data(contentsOf: filePath)
        } catch {
            fatalError("\(fileName)のロードに失敗しました")
        }
        
        do {
            return try JSONDecoder().decode([User].self, from: data)
        } catch {
            fatalError("\(fileName)を\(User.self)に変換することに失敗しました。")
        }
    }
    
    private func fetChatData() -> [User] {
        let fileName = "userData.json"
        let data: Data
        
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: nil)
        else {
            fatalError("\(fileName)が見つかりませんでした")
        }
        
        do {
            data = try Data(contentsOf: filePath)
        } catch {
            fatalError("\(fileName)のロードに失敗しました")
        }
        
        do {
            return try JSONDecoder().decode([User].self, from: data)
        } catch {
            fatalError("\(fileName)を\(User.self)に変換することに失敗しました。")
        }
    }
}

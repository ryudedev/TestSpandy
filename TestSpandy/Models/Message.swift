//
//  Message.swift
//  ChatViewWithSwiftUI
//
//  Created by IT on 2024/05/22.
//

import Foundation

struct Message: Decodable, Identifiable {
    let id: String
    let text: String
    let user: Person
    let date: String
    let readed: Bool
}

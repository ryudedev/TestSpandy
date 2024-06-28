//
//  User.swift
//  TestSpandy
//
//  Created by IT on 2024/06/16.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: String
    var users: [Person]
}

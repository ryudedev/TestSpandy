//
//  Person.swift
//  TestSpandy
//
//  Created by IT on 2024/06/16.
//

import Foundation

struct Person: Hashable, Decodable, Identifiable {
    let id: String
    let first_name: String
    let last_name: String
    let age: Int64
    let password: String
    let email: String
    let gender: Int8
    let birthday: String
    let nationality: String
    let selfPR: String
    let special_note: String
    let carrer_id: String
    let height: Int64
    let weight: Int64
    let is_supporter: Bool
    let paire_id: String
    let created_at: String
    let updated_at: String
}

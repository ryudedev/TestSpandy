//
//  Pending.swift
//  TestSpandy
//
//  Created by IT on 2024/06/18.
//

import Foundation

struct PendingProps: Decodable, Identifiable {
    let id = UUID()
    let reception: [Reception]
    let transmission: Transmission
    let created_at: Date
    let updated_at: Date
}

struct Reception: Decodable, Identifiable {
    let id = UUID()
    let user: Person
}

struct Transmission: Decodable, Identifiable {
    let id = UUID()
    let user: Person
}

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
    
    static var currentPerson: Person {
        Person(
            id: "7b209441-d7e4-3810-716e-4491d82c3ed2",
           first_name: "Halle",
           last_name: "Bailey",
           age: 24,
           password: "fjdslkfgdjrsflidsjgjdrsofgndshjfu",
           email: "hallebailey@gmail.com",
           gender: 0,
           birthday: "2000-6-13",
           nationality: "United Kingdom",
           selfPR: "As Halle Bailey, I recognize that effective PR is crucial to advancing my career as an actress and singer. My team and I take a multifaceted approach to promoting my work and public image.On the acting front, being cast as Ariel in \"The Little Mermaid\" remake has been a major opportunity. I've embraced the role and the movie's publicity campaign - participating in interviews, attending promo events, and expressing my excitement and gratitude to be part of such an iconic project. The press around the film positions me as a rising star in Hollywood.Simultaneously, I continue promoting my music as one half of Chloe x Halle. My sister and I maintain an active presence on social media, especially Instagram and YouTube, regularly engaging with our fan base. We post performance clips, behind-the-scenes content, and updates on our latest projects. Appearing on magazine covers and at fashionable events also keeps us visible in the music and entertainment scene.Across all my promotional endeavors, I aim to come across as grounded, hardworking and appreciative of the opportunities I've received. While I want my talent to be recognized, I avoid crossing over into arrogance or shameless self-promotion that could alienate people. Authenticity is key.My PR approach is really about striking a balance - seizing strategic opportunities to showcase my abilities and share my journey, while still being true to myself. It's about letting my work speak for itself, supported by savvy but sincere promotion. I feel grateful to have a platform and want to keep making the most of it moving forward in my multifaceted career.",
           special_note: "",
           carrer_id: "1",
           height: 162,
           weight: 50,
           is_supporter: true,
           paire_id: "f375f043-568a-dad5-1b82-a3e46ffb9b07",
           created_at: "2023-01-30 14:32:56",
           updated_at: "2023-01-30 14:32:56"
        )
    }
}

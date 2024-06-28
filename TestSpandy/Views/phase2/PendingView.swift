//
//  Pending.swift
//  TestSpandy
//
//  Created by IT on 2024/06/18.
//

import SwiftUI

struct PendingView: View {
    @Environment(\.dismiss) private var dismiss
    let pendingUser:PendingProps = PendingProps(
        reception: [
            Reception(user:
                        Person(
                            id: "f375f043-568a-dad5-1b82-a3e46ffb9b07",
                            first_name: "Chris",
                            last_name: "Evans",
                            age: 42,
                            password: "4jfj39fjwo4jr5k2lf3j5f9d",
                            email: "chrisevans@example.com",
                            gender: 1,
                            birthday: "1982-06-13",
                            nationality: "United States",
                            selfPR: "As Chris Evans, I strive to balance my public persona as an actor with my personal interests and passions. Known for my role as Captain America in the Marvel Cinematic Universe, I participate in various promotional activities for my movies, including interviews, conventions, and fan events. Beyond acting, I am active on social media, particularly Twitter, where I engage with fans and share my thoughts on current events and social issues. Authenticity and relatability are key components of my PR strategy, allowing me to connect with a broad audience.",
                            special_note: "",
                            carrer_id: "2",
                            height: 183,
                            weight: 85,
                            is_supporter: false,
                            paire_id: "7b209441-d7e4-3810-716e-4491d82c3ed2",
                            created_at: "2023-02-01 10:45:00",
                            updated_at: "2023-02-01 10:45:00"
                        )
                     ),
            Reception(user:
                        Person(
                            id: "5a61cfd3-77b2-48f1-a3b8-8e29b8e2c53e",
                            first_name: "Emma",
                            last_name: "Watson",
                            age: 33,
                            password: "3fj83nflskf39fsklfj39",
                            email: "emmawatson@example.com",
                            gender: 0,
                            birthday: "1990-04-15",
                            nationality: "United Kingdom",
                            selfPR: "As Emma Watson, I combine my acting career with my advocacy for women's rights and education. Best known for my role as Hermione Granger in the Harry Potter series, I continue to take on diverse roles in film. My PR strategy involves highlighting my work in both the entertainment industry and my humanitarian efforts. I actively engage with my audience on social media, participate in interviews, and attend events to promote my initiatives. My goal is to inspire and empower others through my platform.",
                            special_note: "",
                            carrer_id: "3",
                            height: 165,
                            weight: 53,
                            is_supporter: true,
                            paire_id: "bc34def5-6789-0123-c45d-e6f7g8h9i0j1",
                            created_at: "2023-02-02 11:30:00",
                            updated_at: "2023-02-02 11:30:00")
                     ),
            Reception(user:
                        Person(
                            id: "bc34def5-6789-0123-c45d-e6f7g8h9i0j1",
                            first_name: "Robert",
                            last_name: "Downey Jr.",
                            age: 58,
                            password: "2fj29jf3n3jfkfslf",
                            email: "robertdowneyjr@example.com",
                            gender: 1,
                            birthday: "1965-04-04",
                            nationality: "United States",
                            selfPR: "As Robert Downey Jr., I embrace my iconic status in the film industry while promoting my work and personal brand. Known for my role as Iron Man, I engage with fans through social media and public appearances. My PR strategy focuses on maintaining a balance between my professional achievements and personal life. I support various charitable initiatives and advocate for environmental sustainability, using my platform to inspire positive change.",
                            special_note: "",
                            carrer_id: "4",
                            height: 174,
                            weight: 78,
                            is_supporter: false,
                            paire_id: "5a61cfd3-77b2-48f1-a3b8-8e29b8e2c53e",
                            created_at: "2023-02-03 12:15:00",
                            updated_at: "2023-02-03 12:15:00"
                        )
                     ),
        ],
        transmission: Transmission(user:
                                    Person(
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
                                        updated_at: "2023-02-04 13:00:00"
                                    )
                                  ),
        created_at: Date(),
        updated_at: Date()
    )
    var body: some View {
        ScrollView {
            VStack {
                Text("Transmission")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.grey300)
                VStack(alignment: .leading) {
                    HStack(alignment: .center, spacing: 44) {
                        Circle()
                            .foregroundColor(.gray)
                            .frame(width: 80, height: 80)
                            .shadow(color: .black.opacity(0.25), radius: 7.5, x: 0, y: 0)
                        VStack(alignment: .leading) {
                            Text("\(pendingUser.transmission.user.first_name) \(pendingUser.transmission.user.last_name)")
                                .font(Font.custom("HiraKakuStd-W7", size: 20))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                            Text("age \(pendingUser.transmission.user.age)")
                                .font(Font.custom("HiraKakuStd-W7", size: 12))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                        }

                    }
                    .padding(24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white)

                    .cornerRadius(24)
                    .shadow(color: .black.opacity(0.12), radius: 4, x: 0, y: 4)
                }
                .padding(.bottom)
                Text("Received")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.grey300)
                VStack(alignment: .leading) {
                    ForEach(pendingUser.reception) { reception in
                        NavigationLink(destination: ProfileView(user: reception.user)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                            .toolbar(.hidden)
                        ) {
                            HStack(alignment: .center, spacing: 44) {
                                Circle()
                                    .foregroundColor(.gray)
                                    .frame(width: 80, height: 80)
                                    .shadow(color: .black.opacity(0.25), radius: 7.5, x: 0, y: 0)
                                VStack(alignment: .leading) {
                                    Text("\(reception.user.first_name) \(reception.user.last_name)")
                                        .font(Font.custom("HiraKakuStd-W7", size: 20))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                                    Text("age \(reception.user.age)")
                                        .font(Font.custom("HiraKakuStd-W7", size: 12))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                                }
                                
                            }
                            .padding(24)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.white)
                            
                            .cornerRadius(24)
                            .shadow(color: .black.opacity(0.12), radius: 4, x: 0, y: 4)
                        }
                    }
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .padding()
            .padding(.top, 72)
        }
        .overlay(header, alignment: .top)
    }
}

#Preview {
    PendingView()
}

extension PendingView {
    private var header: some View {
        HStack(alignment: .center) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.backward")
                    .renderingMode(.template)
                    .font(.title2)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.black)
            }
            Spacer()
        }
        .padding()
        .background(.white)
    }
}

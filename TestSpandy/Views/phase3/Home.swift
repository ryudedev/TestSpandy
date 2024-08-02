//
//  Home.swift
//  TestSpandy
//
//  Created by IT on 2024/06/25.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var cvm: ChatViewModel = ChatViewModel()
    @ObservedObject var uvm: UserViewModel = UserViewModel()
    @State var currentUser: Person = Person(
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
    
    
    //　現在の開いているタブインデックス
    @State var currentTab: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                PairInfoView().environmentObject(dateHolder).tag(0)
                ChatView(chat: cvm.chatData[0], currentUser: currentUser).environmentObject(dateHolder).environmentObject(cvm).tag(1)
                SettingsView(currentUser: currentUser).environmentObject(dateHolder).tag(2)
            }
            .frame(maxHeight: .infinity)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentTab)
            .background(Color.colorScheme)
            ButtonNavigation
        }
    }
}

#Preview {
    Home()
}

extension Home {
    private var ButtonNavigation: some View {
        HStack(alignment: .center)
        {
            Button {
                currentTab = 0
            } label: {
                Image("Person")
                    .frame(width: 50, height: 50, alignment: .center)
                    .toolbar(.hidden)
            }
            Spacer()
            Button {
                currentTab = 1
            } label: {
                Image("Chat")
                    .frame(width: 50, height: 50, alignment: .center)
                    .toolbar(.hidden)
            }
            Spacer()
            Button {
                currentTab = 2
            } label: {
                Image("Setting")
                    .frame(width: 50, height: 50, alignment: .center)
                    .toolbar(.hidden)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding(.horizontal)
        .background(Color.white)
    }
}

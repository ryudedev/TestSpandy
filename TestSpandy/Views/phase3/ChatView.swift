//
//  Chat.swift
//  TestSpandy
//
//  Created by IT on 2024/06/25.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    @EnvironmentObject var cvm: ChatViewModel
    @State var chat: Chat
    let currentUser: Person
    
    @State private var textFieldText: String = ""
    @FocusState private var textFieldFocused: Bool
    
    var body: some View {
        VStack {
            ScrollView {
                MessageView
            }
            inputArea
        }
    }
}

//#Preview {
//    ChatView()
//}

extension ChatView {
    private var MessageView: some View {
        VStack(alignment: .leading) {
            ForEach(chat.messages) { message in
                HStack(alignment: .top) {
                    if message.user.id == currentUser.id {
                        Spacer()
                        Text(message.text)
                            .padding()
                            .background(Color.green300)
                            .cornerRadius(20)
                    } else {
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(Color.gray)
                        Text(message.text)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    private var inputArea: some View {
        HStack() {
            HStack() {
                Image(systemName: "photo")
            }
            .font(.title2)
            TextField("Aa", text: $textFieldText)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(Capsule())
                .overlay(
                    Image(systemName: "face.smiling")
                        .font(.title2)
                        .padding(.trailing)
                        .foregroundColor(.gray)
                    ,alignment: .trailing
                )
                .onSubmit {
                    sendMessage()
                }
                .focused($textFieldFocused)
            Image(systemName: "mic")
                .font(.title2)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(uiColor: .systemBackground))
    }
    
    private func sendMessage() {
        if !textFieldText.isEmpty {
            cvm.addMessage(chatId: chat.id, text: textFieldText)
            textFieldText = ""
        }
    }
}

//
//  chat_view.swift
//  chat
//
//  Created by Igor Gardzielewski on 23/03/2024.
//

import SwiftUI

struct chat_view: View {
    var messages = [
        Message(id: "12345", text: "Sent", received: false, timestamp: Date()),
        Message(id: "12346", text: "Received", received: true, timestamp: Date()),
        Message(id: "123426", text: "Im in love with coding in Swiftui, AAAAAAAAAAAAAaaaaaaaaAAAAaaaaAAAAaaaaAAAAAAaaaAAAAAA", received: true, timestamp: Date()),
        Message(id: "1234622", text: "Me too I hope we found time to help each other", received: false, timestamp: Date()),
        Message(id: "1234622", text: "Me too I hope we found time to help each other", received: false, timestamp: Date()),
        Message(id: "1234622", text: "Me too I hope we found time to help each other", received: false, timestamp: Date()),
        Message(id: "1234622", text: "Me too I hope we found time to help each other", received: false, timestamp: Date()),
        Message(id: "1234622", text: "Me too I hope we found time to help each other", received: false, timestamp: Date()),
        Message(id: "1234622", text: "Me too I hope we found time to help each other", received: false, timestamp: Date())
    ]

    var body: some View {
            VStack {
                ChatHeader()
                ScrollView {
                    ForEach(messages, id: \.id) { message in
                        Message_text(message: message)
                    }
                }
                MessageBox()
                    .ignoresSafeArea(.all)
            }
    }
}

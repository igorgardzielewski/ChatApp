//
//  Chat_View.swift
//  chat
//
//  Created by Igor Gardzielewski on 18/03/2024.
//

import SwiftUI

struct MessageBox: View {
        @State private var message = ""
    var body: some View {
        HStack {
                  CustomTextField(placeholder: Text("Wiadomosc"), text: $message)
                      .frame(height: 52)
                      .disableAutocorrection(true)

                  Button {
                      message = ""
                  } label: {
                      Image(systemName: "paperplane.fill")
                          .foregroundColor(.white)
                          .padding(10)
                          .background(Color.blue)
                          .cornerRadius(50)
                  }
              }
              .padding(.horizontal)
              .padding(.vertical, 10)
              .background(Color.gray.opacity(0.5))
              .cornerRadius(50)
              .padding()
          }
    }

#Preview {
    MessageBox()
}
struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}

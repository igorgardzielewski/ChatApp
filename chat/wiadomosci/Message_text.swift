//
//  Message_text.swift
//  chat
//
//  Created by Igor Gardzielewski on 21/03/2024.
//

import SwiftUI

struct Message_text: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            VStack(alignment: message.received ? .trailing: .leading)
                {
                        HStack {
                            if !message.received
                            {
                                Text(message.text)
                                    .padding()
                                    .background(message.received ? Color.blue.opacity(0.8) : Color.gray.opacity(0.5))
                                    .cornerRadius(30)
                                Image("user_photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(maxWidth: 64,maxHeight: 64,alignment:.bottomLeading)
                            }
                            if message.received
                            {
                                Image("user_photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(maxWidth: 64,maxHeight: 64,alignment:.bottomTrailing)
                                Text(message.text)
                                    .padding()
                                    .background(message.received ? Color.blue.opacity(0.8) : Color.gray.opacity(0.5))
                                    .cornerRadius(30)
                            }
                        }
                        if showTime {
                            Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                                .font(.caption2)
                                .foregroundColor(.gray)
                                .padding(message.received ? .trailing : .leading, 25)
                                .padding(.bottom)
                                .transition(.asymmetric(insertion: .scale, removal: .opacity))
                        }
                    
                    }
                }
                .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
                .onTapGesture {
                        withAnimation
                        {
                            showTime.toggle()
                        }
                }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
    }
}
#Preview {
    Message_text(message:Message(id:"12345",text:"Iveben",received: false,timestamp: Date()))
}

//
//  ContentView.swift
//  ChatAppDemo
//
//  Created by Thomas Lawless III on 7/26/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    var messageArray = ["Hello you",
                       "How are you doing",
                       "I am good"]
    
    var body: some View {
        VStack {
            VStack{
                TitleRow()
                
                ScrollView {
                    ForEach(messagesManager.messages, id: \.id){
                        message in
                        MessageBubble(message: message)
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners:  [.topLeft, .topRight])
            }
            .background(Color("Peach"))
            MessageField()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MessagesManager())
    }
}

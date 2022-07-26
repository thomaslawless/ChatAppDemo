//
//  MessagesManager.swift
//  ChatAppDemo
//
//  Created by Thomas Lawless III on 7/26/22.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    let db = Firestore.firestore()
    
    init(){
        getMessages()
    }
    
    func getMessages(){
        db.collection("messages").addSnapshotListener{ QuerySnapshot, error in
            guard let documents = QuerySnapshot?.documents else{
                print("error collecting documents: \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap{ document -> Message? in
                do {
                    return try document.data(as: Message.self)
                }catch {
                    print ("error decoding document into message: \(error)")
                    return nil
                }
            }
            self.messages.sort {$0.timestamp < $1.timestamp}
        }
    }
    
    func sendMessage(text:String){
        do {
            let newMessage = Message(id: "\(UUID())", text:text, recieved: false, timestamp: Date())
            
            try db.collection("messages").document().setData(from: newMessage)
            
        }catch{
            print("error adding to firestore \(error)")
        }
    
}
}

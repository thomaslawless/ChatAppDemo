//
//  Message.swift
//  ChatAppDemo
//
//  Created by Thomas Lawless III on 7/26/22.
//

import Foundation

struct Message: Identifiable, Codable{
    var id: String
    var text: String
    var recieved: Bool
    var timestamp: Date
}

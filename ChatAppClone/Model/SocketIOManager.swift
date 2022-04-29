//
//  SocketIOManager.swift
//  ChatAppClone
//
//  Created by Tuan on 21/04/2022.
//
//

import Foundation
import SocketIO
import UIKit

let kHost = "http://localhost:9000"
let kConnectUser = "connectUser"
let kUserList = "userList"
let kExitUser = "exitUser"


final class SocketIOManager: NSObject {
    
    static let shared = SocketIOManager()
    
    private var manager: SocketManager?
    private var socket: SocketIOClient?
    
    override init() {
        super.init()
        configureSocketClient()
    }
    
    private func configureSocketClient() {
        
        guard let url = URL(string: kHost) else {
            return
        }
        
        manager = SocketManager(socketURL: url, config: [.log(true), .compress])
        
        
        guard let manager = manager else {
            return
        }
        
        socket = manager.socket(forNamespace: "/**********")
    }
    
    func establishConnection() {
        
        guard let socket = manager?.defaultSocket else{
            return
        }
        
        socket.connect()
    }
    
    func closeConnection() {
        
        guard let socket = manager?.defaultSocket else{
            return
        }
        
        socket.disconnect()
    }
    
    func joinChatRoom(nickname: String) {
        
        guard let socket = manager?.defaultSocket else {
            return
        }
        
        socket.emit(kConnectUser, nickname)
    
    }
        
    func leaveChatRoom(nickname: String, completion: () -> Void) {
        
        guard let socket = manager?.defaultSocket else{
            return
        }
        
        socket.emit(kExitUser, nickname)
        completion()
    }
    
    func participantList(completion: @escaping (_ userList: [User]?) -> Void) {
        
        guard let socket = manager?.defaultSocket else {
            return
        }
        
        socket.on(kUserList) { [weak self] (result, ack) -> Void in
            
            guard result.count > 0,
                let _ = self,
                let user = result.first as? [[String: Any]],
                let data = UIApplication.jsonData(from: user) else {
                    return
            }
            
            do {
                let userModel = try JSONDecoder().decode([User].self, from: data)
                completion(userModel)
                
            } catch let error {
                print("Something happen wrong here...\(error)")
                completion(nil)
            }
        }
        
    }
    
    func getMessage(completion: @escaping (_ messageInfo: MessageType?) -> Void) {
        
        guard let socket = manager?.defaultSocket else {
            return
        }
        
        socket.on("newChatMessage") { (dataArray, socketAck) -> Void in
            
            var messageInfo = [String: Any]()
            
            guard let nickName = dataArray[0] as? String,
                let message = dataArray[1] as? String,
                let date = dataArray[2] as? String else{
                    return
            }
            
            messageInfo["nickname"] = nickName
            messageInfo["message"] = message
            messageInfo["date"] = date
            
            guard let data = UIApplication.jsonData(from: messageInfo) else {
                return
            }

            do {
                let messageModel = try JSONDecoder().decode(MessageType.self, from: data)
                completion(messageModel)
                
            } catch let error {
                print("Something happen wrong here...\(error)")
                completion(nil)
            }
        }
    }
    
    func sendMessage(message: String, withNickname nickname: String) {
        
        guard let socket = manager?.defaultSocket else {
            return
        }
        
        socket.emit("chatMessage", nickname, message)
    }
}

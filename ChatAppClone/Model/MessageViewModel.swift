//
//  MessageViewModel.swift
//  ChatAppClone
//
//  Created by Tuan on 22/04/2022.
//

import Foundation

final class MessageViewModel {
    
    var arrMessage: KxSwift<[MessageType]> = KxSwift<[MessageType]>([])
    
    func getMessagesFromServer() {
        
        SocketIOManager.shared.getMessage { [weak self] (message: MessageType?) in
            
            guard let self = self,
            let msgInfo = message else {
                return
            }
            
            self.arrMessage.value.append(msgInfo)
        }
    }
}


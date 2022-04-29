//
//  DetailMessageController.swift
//  ChatAppClone
//
//  Created by Tuan on 21/04/2022.
//

import Foundation
import UIKit

class DetailMessageController: UIViewController{
    
    var nickName:String?
    @IBOutlet weak var sentButton: UIButton!
    @IBOutlet weak var textData: UITextView!{
        didSet{
        textData.layer.cornerRadius = textData.frame.height/2
        textData.layer.borderWidth = 1.0
        }
    }
    @IBOutlet weak var MessageTable: UITableView!
    private var messageViewModel: MessageViewModel = MessageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuartionTableView()
        configureViewModel()
        self.title = nickName
    }
    
    @IBAction func btnSendCLK(_ sender: UIButton) {
        
        guard textData.text.count > 0,
            let message = textData.text,
            let name = nickName else {
            print("Please type your message.")
            return
        }
        
        textData.resignFirstResponder()
        SocketIOManager.shared.sendMessage(message: message, withNickname: name)
        textData.text = nil
    }
}


extension DetailMessageController{
    private func configureViewModel() {
        
        messageViewModel.arrMessage.subscribe { [weak self] (result: [MessageType]) in
            
            guard let self = self else {
                return
            }
            self.MessageTable.separatorStyle = .none
            self.MessageTable.reloadData()
            //self.MessageTable.scrollToBottom(animated: false)
        }
        
        messageViewModel.getMessagesFromServer()
    }
    
    private func configuartionTableView() {
        
        self.MessageTable.register(UINib(nibName: "MessageSendTableViewCell", bundle: nil), forCellReuseIdentifier: "MessageSendTableViewCell")
        self.MessageTable.register(UINib(nibName: "MessageTableViewCell", bundle: nil), forCellReuseIdentifier: "MessageTableViewCell")
        
        self.MessageTable.dataSource = self
        self.MessageTable.delegate = self
    }
}


extension DetailMessageController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageViewModel.arrMessage.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message: MessageType = messageViewModel.arrMessage.value[indexPath.row]
        
        if message.nickname == nickName {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MessageSendTableViewCell") as? MessageSendTableViewCell else {
                return UITableView.emptyCell()
            }
            
            cell.configureCell(message)
            return cell
            
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell") as? MessageTableViewCell else {
            return UITableView.emptyCell()
        }
        
        cell.configureCell(message)
        return cell
        }
    }
    
    


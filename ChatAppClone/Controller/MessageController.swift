//
//  MessageController.swift
//  ChatAppClone
//
//  Created by Tuan on 21/04/2022.
//

import Foundation

import UIKit

class MessageController: UIViewController {

    var onDidSelect: ((User) -> Void)?
    @IBOutlet weak var tableViewData: UITableView!
    
    var chatViewModel: ChatViewModel = ChatViewModel()
    var nickName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "Message", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! Message
        view.userColletion.delegate = self
        view.userColletion.dataSource = self
        
        
        let cellNib = UINib(nibName: "UserAvatarCell", bundle: nil)
        view.userColletion.register(cellNib, forCellWithReuseIdentifier: "UserAvatarCell")
        
        
        tableViewData.delegate = self
        tableViewData.dataSource = self
        
        let messageNib = UINib(nibName: "MessageCell", bundle: nil)
        tableViewData.register(messageNib, forCellReuseIdentifier: "MessageCellid")

        
        configureViewModel()
        print("Count: \(chatViewModel.arrUsers.value.count)")
        //self.view.addSubview(view)
        // Do any additional setup after loading the view.

 
    }
}


extension MessageController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatViewModel.arrUsers.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserAvatarCell", for: indexPath) as? UserAvatarCell {
            //cell.avatar.image = UIImage(named: "mail")
            cell.userName.text = chatViewModel.arrUsers.value[indexPath.row].nickname
            return cell
        }
        return UICollectionViewCell()
        
        
    }
    
    
}

extension MessageController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatViewModel.arrUsers.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCellid", for: indexPath) as! MessageCell
        cell.userName.text = chatViewModel.arrUsers.value[indexPath.row].nickname
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mapView = self.storyboard?.instantiateViewController(withIdentifier: "DetailMessageController") as! DetailMessageController
        //let user: User = chatViewModel.arrUsers.value[indexPath.row]
        mapView.nickName = self.nickName
        self.navigationController?.pushViewController(mapView, animated: true)
//        let user: User = chatViewModel.arrUsers.value[indexPath.row]
//        onDidSelect?(user)
    }
}

extension MessageController{
    private func configureViewModel() {
        
        guard let name = nickName else {
            return
        }
        
        chatViewModel.arrUsers.subscribe {[weak self] (result: [User]) in
            self?.tableViewData.reloadData()
        }
        
        print(name)
        chatViewModel.fetchParticipantList(name)
    }

}

//
//  LoginController.swift
//  ChatAppClone
//
//  Created by Tuan on 21/04/2022.
//

import Foundation
import UIKit

class LoginController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "Login", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! Login
        
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.delegate = self
        self.navigationItem.backButtonTitle = ""
        
        print("User")
        self.view.addSubview(view)
        
    }


}

extension LoginController: LoginViewDelegate{
    func LoginToApp(data: String) {
//        let nib = UINib(nibName: "Login", bundle: nil)
//        let view = nib.instantiate(withOwner: self, options: nil)[0] as! Login
        //let home = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        let mapView = self.storyboard?.instantiateViewController(withIdentifier: "MessageController") as! MessageController
//        guard let nickName = view.emailTextfield.text else{
//            return
//        }
        SocketIOManager.shared.joinChatRoom(nickname: data)
        mapView.nickName = data
        self.navigationController?.pushViewController(mapView, animated: true)
    }
    
    func ForgotPassword() {
        let mapView = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        mapView.view.backgroundColor = .purple
        self.navigationController?.pushViewController(mapView, animated: true)
        print("ForgotPassword")
    }
    
    func Register() {
        let mapView = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        mapView.view.backgroundColor = .purple
        self.navigationController?.pushViewController(mapView, animated: true)
        print("Register")
    }
    

    
    
}



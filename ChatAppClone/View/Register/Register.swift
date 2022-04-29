//
//  Register.swift
//  ChatAppClone
//
//  Created by Tuan on 21/04/2022.
//

import Foundation
import UIKit

protocol RegisterViewDelegate{
    func checkBox()
    func registerAction()
    func loginAction()
    func backToLogin()
}
class Register: UIView{
    
    @IBOutlet var userTf: UITextField!
    @IBOutlet var emailTf: UITextField!
    @IBOutlet var passwordTf: UITextField!
    @IBOutlet var checkbox: UIImageView!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var signInButton: UIButton!
    var delegate: RegisterViewDelegate!
    var check: Bool = false
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        signUpButton.backgroundColor = .darkGray
        signUpButton.isEnabled = false
        signUpButton.layer.cornerRadius = 15.0
        
        checkbox.layer.borderWidth = 0.3
        checkbox.layer.cornerRadius = checkbox.bounds.width/2
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        checkbox.isUserInteractionEnabled = true
        checkbox.addGestureRecognizer(tapGestureRecognizer)
        
        setupView()
    }
    
    @IBAction func signUp(_ sender: Any) {
    }
    

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.delegate.checkBox()
        //let tappedImage = tapGestureRecognizer.view as! UIImageView
        print("Hello Image")
        if check{
            checkbox.image = nil
            check = !check
            signUpButton.isEnabled = !signUpButton.isEnabled
            signUpButton.backgroundColor = .darkGray
            
        }else{
            checkbox.image = UIImage(named: "check")
            check = !check
            signUpButton.isEnabled = !signUpButton.isEnabled
            signUpButton.backgroundColor = .systemBlue
            
        }
        // Your action
        
    }
    
    @IBAction func backToLogin(){
        self.delegate.backToLogin()
    }
    func setupView(){
        if let myImage = UIImage(named: "User"){
            userTf.withImage(direction: .Right, image: myImage)
        }

        if let myImage = UIImage(named: "mail"){
            emailTf.withImage(direction: .Right, image: myImage)
        }

        if let myImage = UIImage(named: "password"){
            passwordTf.withImage(direction: .Right, image: myImage)
        }
        //login.layer.cornerRadius = 25
        print("Hello")
    }

}

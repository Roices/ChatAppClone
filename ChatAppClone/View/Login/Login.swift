//
//  Login.swift
//  ChatAppClone
//
//  Created by Tuan on 21/04/2022.
//
import Foundation
import UIKit

protocol LoginViewDelegate: AnyObject{
    func LoginToApp(data: String)
    func ForgotPassword()
    func Register()
}

class Login: UIView {
    
    weak var delegate: LoginViewDelegate?
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //setupView()
    }
    
    override func awakeFromNib() {
        print(#function)
        super.awakeFromNib()
        setupView()
        
       
    }
    
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        self.delegate?.ForgotPassword()
        print("Hello")
    }
    
    @IBAction func loginButton(_ sender: Any) {
        guard let dataToSent = emailTextfield.text else {
            return
        }
        self.delegate?.LoginToApp(data: dataToSent)
    }
    
    
    @IBAction func registerAction(_ sender: Any) {
        self.delegate?.Register()
    }
    
    func setupView(){
        if let myImage = UIImage(named: "mail"){
            emailTextfield.withImage(direction: .Right, image: myImage)
        }

        if let myImage = UIImage(named: "password"){
            passwordTextfield.withImage(direction: .Right, image: myImage)
        }

        login.layer.cornerRadius = 25
        print("Hello")
    }
    
}


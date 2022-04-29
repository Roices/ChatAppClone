//
//  RegisterController.swift
//  ChatAppClone
//
//  Created by Tuan on 21/04/2022.
//

import Foundation

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "Register", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! Register
        view.delegate = self
        //self.navigationItem.backButtonTitle = "acb"
        self.view.addSubview(view)
        // Do any additional setup after loading the view.
    }
    



}


extension RegisterViewController: RegisterViewDelegate{
    func backToLogin() {
        //
    }
    
    func checkBox() {
        //
    }
    
    func registerAction() {
        //
    }
    
    func loginAction() {
        //
    }
    

    
    
}

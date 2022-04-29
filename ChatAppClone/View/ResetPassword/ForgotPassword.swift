//
//  ForgotPassword.swift
//  ChatAppClone
//
//  Created by Tuan on 21/04/2022.
//

import Foundation
import UIKit

class ForgotPassword: UIView {
    
    @IBOutlet var emailTf: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sendButton.layer.cornerRadius = 15.0
        if let myImage = UIImage(named: "mail"){
            emailTf.withImage(direction: .Right, image: myImage)
        }
        
    }
    
    
}

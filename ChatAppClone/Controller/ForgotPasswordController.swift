//
//  ForgotPasswordController.swift
//  ChatAppClone
//
//  Created by Tuan on 21/04/2022.
//

import Foundation

import UIKit

class ForgotPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "ForgotPassword", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! ForgotPassword
       // view.delegate = self
        self.navigationItem.backButtonTitle = ""
        
        self.view.addSubview(view)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

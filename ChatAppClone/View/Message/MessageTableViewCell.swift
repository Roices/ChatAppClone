//
//  MessageTableViewCell.swift
//  ChatAppClone
//
//  Created by Tuan on 23/04/2022.
//

import Foundation
import UIKit

class MessageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var viewContainer: UIView!{
        didSet {
            viewContainer.layer.cornerRadius = 8.0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(_ message: MessageType) {
        
        self.lblMessage.text = message.message ?? ""
        self.lblDate.text = message.date ?? ""
    }
    
}

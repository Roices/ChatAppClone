//
//  MessageCell.swift
//  ChatAppClone
//
//  Created by Tuan on 21/04/2022.
//

import Foundation
import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet var avatar: UIImageView!
    @IBOutlet var message: UILabel!
    @IBOutlet var userName: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var unsendMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //unsendMessage.backgroundColor = .red
        unsendMessage.layer.cornerRadius = 30
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

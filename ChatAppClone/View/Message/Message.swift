//
//  Message.swift
//  ChatAppClone
//
//  Created by Tuan on 21/04/2022.
//

import Foundation

import UIKit

class Message: UIView {
    
    @IBOutlet var userColletion: UICollectionView!
    @IBOutlet var messageTable: UITableView!
    
    @IBOutlet weak var backGroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 75, height: 101)
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 20
        self.userColletion.collectionViewLayout = flowLayout
        self.userColletion.showsHorizontalScrollIndicator = false
        
        userColletion.layer.cornerRadius = 15
        userColletion.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        backGroundView.layer.cornerRadius = 15
        backGroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        messageTable.layer.borderWidth = 0.2
        messageTable.separatorStyle = .none
        
        
        
    }
}

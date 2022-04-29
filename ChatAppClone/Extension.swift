//
//  Extension.swift
//  ChatAppClone
//
//  Created by Tuan on 21/04/2022.
//

import Foundation
import UIKit

extension UITextField {

enum Direction {
    case Left
    case Right
}

// add image to textfield
func withImage(direction: Direction, image: UIImage){
    let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    mainView.layer.cornerRadius = 5

    let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    view.backgroundColor = .white
    view.clipsToBounds = true
    

    mainView.addSubview(view)

    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
    view.addSubview(imageView)

    if(Direction.Left == direction){ // image left
        self.leftViewMode = .always
        self.leftView = mainView
    } else { // image right
        self.rightViewMode = .always
        self.rightView = mainView
    }


}

}

extension UIApplication {
    
    static func jsonString(from object:Any) -> String? {
        
        guard let data = jsonData(from: object) else {
            return nil
        }
        
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    static func jsonData(from object:Any) -> Data? {
        
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        
        return data
    }
    
    
}

extension UITableView {
    
    static func emptyCell() -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        return cell
    }
    
    func scrollToBottom(animated: Bool = true) {
        
        DispatchQueue.main.async {
            
            var yOffset: CGFloat = 0.0;

            if (self.contentSize.height > self.bounds.size.height) {
                yOffset = self.contentSize.height - self.bounds.size.height;
            }
            
            self.setContentOffset(CGPoint(x: 0, y: yOffset), animated: animated)
        }
    }
}

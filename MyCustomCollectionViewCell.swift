//
//  MyCustomCollectionViewCell.swift
//  store
//
//  Created by 정현진 on 2022/11/20.
//

import Foundation
import UIKit
class MyCustomCollectionViewCell: UICollectionViewCell {
   
    
    @IBOutlet var profileImg: UIImageView!
    
    var imageName : String = ""{
        didSet{
            print("MyCustomCollectionViewCell / imageName - didSet() : \(imageName)")
            // 쎌의 UI 설정
            self.profileImg.image = UIImage(systemName: imageName)
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("MyCustomCollectionViewCell - awakeFromNib() called")
        contentView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    
    }
}


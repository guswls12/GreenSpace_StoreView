//
//  StoreCollectionViewCell.swift
//  store
//
//  Created by 정현진 on 2022/11/16.
//

import Foundation
import UIKit
class StoreCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var profileimg: UIImageView!  // 컬렉션뷰 상점 아이템 이미지
    
    var imageName : String = ""{
        didSet{
            print("StoreCollectionViewCell / imageName - didSet() : \(imageName)")
            // 쎌의 UI 설정
            self.profileimg.image = UIImage(systemName: imageName)
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("StoreCollectionViewCell - awakeFromNib()")
        self.contentView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        self.contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    }
}

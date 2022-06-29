//
//  ArchievementCollectionViewCell.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import UIKit

class ArchievementCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var lblMain: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUI(data:ArchievementBadge){
        imgMain.image = UIImage(named: data.image)
        lblMain.text = data.name
        self.layer.borderColor = Colors.appRed.cgColor
        self.layer.borderWidth = 1
    }
    
    

}

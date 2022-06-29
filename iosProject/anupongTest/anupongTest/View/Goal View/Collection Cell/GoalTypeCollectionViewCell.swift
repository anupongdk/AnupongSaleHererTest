//
//  GoalTypeCollectionViewCell.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 29/6/2565 BE.
//

import UIKit

class GoalTypeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgMain: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUI(cellType:Goaltype){
        switch cellType {
        case .Travel:
            imgMain.image = UIImage(named: "icTravel")
            lblName.text = "Travel"
        case .Education:
            imgMain.image = UIImage(named: "icEducation")
            lblName.text = "Education"
        case .Invest:
            imgMain.image = UIImage(named: "icInvest")
            lblName.text = "Invest"
        case .Clothing:
            imgMain.image = UIImage(named: "icClothing")
            lblName.text = "Clothing"
        }
        
        self.layer.borderColor = Colors.appRed.cgColor
        self.layer.borderWidth = 1.5
        self.layer.cornerRadius = 4
        lblName.textColor = Colors.appDarkGrey
        
    }

}

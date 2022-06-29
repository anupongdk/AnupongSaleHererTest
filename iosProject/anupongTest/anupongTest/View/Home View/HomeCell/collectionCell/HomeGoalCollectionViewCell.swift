//
//  HomeGoalCollectionViewCell.swift
//  AnupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import UIKit

class HomeGoalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgViewIcon: UIImageView!
    @IBOutlet weak var lblCurrentBudget: UILabel!
    @IBOutlet weak var lblTotalBuget: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblDateLeft: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setData(dataObject:GoalModel){
        switch dataObject.type {
        case .Travel:
            imgViewIcon.image = UIImage(named: "icTravel")
        case .Education:
            imgViewIcon.image = UIImage(named: "icEducation")
        case .Invest:
            imgViewIcon.image = UIImage(named: "icInvest")
        case .Clothing:
            imgViewIcon.image = UIImage(named: "icClothing")
        }
        switch dataObject.status {
        case .Good:
            self.layer.borderColor = Colors.appGreen.cgColor
            lblStatus.textColor = Colors.appGreen
        case .Unhappy:
            self.layer.borderColor = Colors.appRed.cgColor
            lblStatus.textColor = Colors.appRed
        }
        
        
        
        lblCurrentBudget.text = "\(dataObject.currentBudget) THB"
        lblTotalBuget.text = "\(dataObject.totalBudget) THB"
        print(Float((dataObject.currentBudget/dataObject.totalBudget)))
        progressView.progress = (Float(dataObject.currentBudget)/Float(dataObject.totalBudget))
        lblName.text = dataObject.name
        lblStatus.text = dataObject.status.stringValue
        //lblDateLeft.text = dataObject.goallDate
        
        
        
    }
    

}

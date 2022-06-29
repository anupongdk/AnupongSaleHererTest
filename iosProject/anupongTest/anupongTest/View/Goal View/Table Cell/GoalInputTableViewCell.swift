//
//  GoalInputTableViewCell.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 29/6/2565 BE.
//

import UIKit

class GoalInputTableViewCell: UITableViewCell {
    
    @IBOutlet weak var constraintArrow: NSLayoutConstraint!
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var lblUnit: UILabel!
    @IBOutlet weak var tfMain: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(){
        lblUnit.textColor = Colors.appRed
        viewBg.layer.borderWidth = 1
        viewBg.layer.borderColor = Colors.appRed.cgColor
    }
    
    func setUI(menu:GoalTextMenu){
        lblUnit.textColor = Colors.appRed
        viewBg.layer.borderWidth = 1
        viewBg.layer.borderColor = Colors.appRed.cgColor
        
        lblUnit.text = menu.unit
        tfMain.placeholder = menu.placeHolder
        
        switch menu.type {
        case .normal:
            constraintArrow.constant = 0
            break
        case .datePicker:
            tfMain.inputView = UIDatePicker()
            constraintArrow.constant = 20
            break
        case .dropdown:
            constraintArrow.constant = 20
            break
        }
        
    }
    
}

extension GoalInputTableViewCell:UITextFieldDelegate {
    
    
    
}

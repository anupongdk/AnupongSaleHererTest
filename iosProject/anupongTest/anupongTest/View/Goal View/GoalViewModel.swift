//
//  GoalViewModel.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import Foundation

class GoalViewModel:GoalViewInteractorOutput,GoalViewInterface {
    
    var goalViewDataDidChange: ((Any) -> Void)?
    var input: GoalViewInteractorInput{return self}
    var output: GoalViewInteractorOutput{ return self}
    var goalFormData = [Any]()
    
}

extension GoalViewModel{
    
    func getGoalFormData() {
        
        
        var arrayData = [Any]()
        
        var arrayGoalType = [Goaltype]()
        arrayGoalType.append(.Travel)
        arrayGoalType.append(.Education)
        arrayGoalType.append(.Invest)
        arrayGoalType.append(.Clothing)
        arrayGoalType.append(.Education)
        
        let goalMenu1 = GoalFormMenu(name: "", data: arrayGoalType)
        arrayData.append(goalMenu1)
        
        var arrayTfSection2 = [GoalTextMenu]()
        arrayTfSection2.append(GoalTextMenu(type: .normal, placeHolder: "Amount", unit: "THB"))
        arrayTfSection2.append(GoalTextMenu(type: .datePicker, placeHolder: "Select Date", unit: ""))
        
        let goalMenu2 = GoalFormMenu(name: "", data: arrayTfSection2)
        arrayData.append(goalMenu2)
        
        var arrayTfSection3 = [GoalTextMenu]()
        arrayTfSection3.append(GoalTextMenu(type: .dropdown, placeHolder: "Select Account", unit: "THB"))
        arrayTfSection3.append(GoalTextMenu(type: .normal, placeHolder: "", unit: "THB/Month"))
        
        let goalMenu3 = GoalFormMenu(name: "Bank Account", data: arrayTfSection3)
        arrayData.append(goalMenu3)
        
        goalFormData = arrayData
        goalViewDataDidChange?(goalFormData)
    }
}

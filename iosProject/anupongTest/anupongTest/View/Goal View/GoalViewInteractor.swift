//
//  GoalViewInteractor.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import Foundation

protocol GoalViewInteractorInput {
    func getGoalFormData()
}

protocol GoalViewInteractorOutput:AnyObject{
    var goalViewDataDidChange:((Any) -> Void)? {get set}
}

protocol GoalViewInterface:GoalViewInteractorInput,GoalViewInteractorOutput{
    var input:GoalViewInteractorInput{get}
    var output:GoalViewInteractorOutput{get}
}


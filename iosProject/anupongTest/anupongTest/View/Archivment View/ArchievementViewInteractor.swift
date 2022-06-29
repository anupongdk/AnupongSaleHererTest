//
//  ArchievementViewInteractor.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

import Foundation

protocol ArchievementInteractorInput {
    func getArchievementData()
}

protocol ArchievementInteractorOutput:AnyObject{
    var archievementDataDidChange:((ArchievementModel) -> Void)? {get set}
}

protocol ArchievementInterface:ArchievementInteractorInput,ArchievementInteractorOutput {
    
    var input: ArchievementInteractorInput{get}
    var output: ArchievementInteractorOutput {get}
}


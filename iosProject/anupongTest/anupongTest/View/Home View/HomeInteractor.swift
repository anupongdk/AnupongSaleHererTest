//
//  HomeInteractor.swift
//  anupongTest
//
//  Created by anupong dorkkunm on 28/6/2565 BE.
//

protocol HomeInteractorInput {
    func getHomeData()
}

protocol HomeInteractorOutput: AnyObject {
    var homeDataDidChange:(([[Any]]) -> Void)? { get set }
    
}

protocol HomeInterface: HomeInteractorInput, HomeInteractorOutput {
    var input: HomeInteractorInput { get }
    var output: HomeInteractorOutput { get }
}


//
//  Presenter.swift
//  Viper Get Started
//
//  Created by Zakarai Lachkar on 20/11/2023.
//

import Foundation

enum FeatchError: Error {
    case failed
}

protocol MyPresenter {
    var router: MyRouter? { get set }
    var interactor: MyInteractor? { get set }
    var view: MyView? { get set }
    
    func interactorDidFeatchUsers(with result: Result<[User], Error>)
}

class UserPresenter: MyPresenter {
    var router: MyRouter?
    
    var interactor: MyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    var view: MyView?
    
    func interactorDidFeatchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure(let failure):
            view?.update(with: "Something weant wrong")
            
        }
    }
    
    
}

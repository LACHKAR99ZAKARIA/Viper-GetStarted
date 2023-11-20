//
//  Router.swift
//  Viper Get Started
//
//  Created by Zakarai Lachkar on 20/11/2023.
//

import Foundation
import UIKit

typealias EntryPoint = MyView & UIViewController

protocol MyRouter {
    var entery: EntryPoint? { get }
    
    static func start() -> MyRouter
}

class UserRouter: MyRouter {
    var entery: EntryPoint?
    
    static func start() -> MyRouter {
        var router = UserRouter()
        
        var view: MyView = UserViewController()
        
        var presenter: MyPresenter = UserPresenter()
        
        var interactor: MyInteractor = UserInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entery = view as? EntryPoint
        
        return router
    }
    
}

//
//  Interactor.swift
//  Viper Get Started
//
//  Created by Zakarai Lachkar on 20/11/2023.
//

import Foundation

protocol MyInteractor {
    var presenter: MyPresenter? { get set }
    
    func getUsers()
}

class UserInteractor: MyInteractor {
    var presenter: MyPresenter?
    
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                self.presenter?.interactorDidFeatchUsers(with: .failure(FeatchError.failed))
                return
            }
            do {
                let enteties = try JSONDecoder().decode([User].self, from: data)
                self.presenter?.interactorDidFeatchUsers(with: .success(enteties))
            } catch {
                self.presenter?.interactorDidFeatchUsers(with: .failure(FeatchError.failed))
            }
        }
        task.resume()
    }
}

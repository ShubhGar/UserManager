//
//  UserListViewModel.swift
//  MyApplication
//
//  Created by Shubham Garg on 29/01/20.
//  Copyright © 2020 Shubham Garg. All rights reserved.
//

import Foundation
import UIKit
//protocol UserDataViewerProtocol:NSObjectProtocol {
//    func updateUsers(users:UserViewModels)
//    func showError(message:String)
//}

protocol UserDataViewerProtocol:class {
    func updateUsers(users:UserViewModels)
    func showError(message:String)
}

typealias UserViewModels = [UserViewModel]

class UserListViewModel{
    weak var delegate:UserDataViewerProtocol?
    var userList:UserList?
    var users:Users = []
    var pageNumber = 0
    var dataFetcher:NetworkDataFetcher
    
    init(dataFetcher:NetworkDataFetcher = NetworkDataFetcher.shared,delegate:UserDataViewerProtocol?) {
        self.delegate = delegate
        self.dataFetcher = dataFetcher
    }
    
    func fetchNextData(){
        pageNumber += 1
        if let list = userList, list.total_pages < pageNumber {
            return
        }
        self.fetchUser(pageNumber: self.pageNumber)
        
    }
    
    private func fetchUser(pageNumber: Int = 1){
        if let url = URL(string: USERURL + "\(pageNumber)"){
            dataFetcher.requestData(url: url) { (result) in
                switch result {
                case .success(let returnData) :
                    if let data = returnData as? Data, let list = try? JSONDecoder().decode(UserList.self, from: data) {
                        self.userList = list
                        if list.page == 1{
                            self.users = list.data
                        }
                        else{
                            self.users.append(contentsOf: list.data)
                        }
                        let userVMs = self.users .map { (user) -> UserViewModel in
                            return UserViewModel(user: user)
                        }
                        self.delegate?.updateUsers(users: userVMs)
                    }
                    else{
                        self.delegate?.showError(message: RequestError.unknownError.localizedDescription)
                    }
                case .failure(let failure) :
                    self.delegate?.showError(message: failure.localizedDescription)
                    break
                }
            }
        }
    }
    
    func moveToDetail(user:UserViewModel, parentVC:UIViewController){
        let vc = UserDetailViewController.initFromStoryboard()
        vc.viewModel = user
        parentVC.navigationController?.pushViewController(vc, animated: true)
    }
}

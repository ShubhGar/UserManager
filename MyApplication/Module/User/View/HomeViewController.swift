//
//  HomeViewController.swift
//  MyApplication
//
//  Created by Shubham Garg on 30/01/20.
//  Copyright © 2020 Shubham Garg. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,StoryboardInitializable {
    
    @IBOutlet var userListView: UIView!
    var viewModel: UserListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = UserListViewModel(delegate: self)
        self.loadNextData()
    }
    
    private lazy var usersViewController: UserListViewController = {
        var viewController = UserListViewController.initFromStoryboard()
        viewController.delegate = self
        self.add(asChildViewController: viewController, to: userListView)
        return viewController
    }()
    
    func loadNextData(){
        viewModel?.fetchNextData()
    }
    
    func showDetail(user:UserViewModel){
        viewModel?.moveToDetail(user: user, parentVC: self)
    }
    
}

extension HomeViewController: UserDataViewerProtocol {
    func updateUsers(users: UserViewModels) {
        DispatchQueue.main.async {
            self.usersViewController.updateUserList(users: users)
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}

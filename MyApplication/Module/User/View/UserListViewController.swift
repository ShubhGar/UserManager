//
//  UserListViewController.swift
//  MyApplication
//
//  Created by Shubham Garg on 30/01/20.
//  Copyright © 2020 Shubham Garg. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController, StoryboardInitializable {
    
    @IBOutlet var usersTableView: UITableView!
    var users:UserViewModels = []
    weak var delegate: HomeViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
    }
    
    private func setUpTableView(){
        usersTableView.dataSource = self
        usersTableView.delegate = self
        usersTableView.tableFooterView = UIView(frame: .zero)
    }
    
    func updateUserList(users:UserViewModels){
        self.users = users
        self.usersTableView.reloadData()
    }
    
    fileprivate func loadNext(){
        delegate?.loadNextData()
    }
    
    fileprivate func showDetail(user:UserViewModel){
        delegate?.showDetail(user: user)
    }
}


extension UserListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showDetail(user: users[indexPath.row])
    }
}

extension UserListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserTableViewCell.self)) as! UserTableViewCell
        cell.setData(user: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension UserListViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let lastVisibleIndexPath = self.usersTableView.indexPathsForVisibleRows?.last {
            let dataCount = users.count
            let dif = abs(dataCount - lastVisibleIndexPath.row)
            if dif == 1 {
                self.loadNext()
            }
        }
    }
}

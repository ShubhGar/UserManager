//
//  UserDetailViewController.swift
//  MyApplication
//
//  Created by Shubham Garg on 30/01/20.
//  Copyright © 2020 Shubham Garg. All rights reserved.
//

import UIKit
import SDWebImage
class UserDetailViewController: UIViewController, StoryboardInitializable {
    @IBOutlet var userEmailTextField: DesignableUITextField!
    @IBOutlet var userMobileTextField: DesignableUITextField!
    @IBOutlet var userNameTextField: DesignableUITextField!
    @IBOutlet var userImage: UIImageView!
    
    var viewModel:UserViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpValues()
    }
    
    func setUpValues(){
        if let model = viewModel{
            self.set(name: model.userName)
            self.set(mobile: model.mobileNo)
            self.set(email: model.userEmail)
            if let url = model.userImageUrl{
                self.set(imageUrl: url)
            }
        }
    }
    
    func set(imageUrl: URL){
        userImage.sd_setImage(with: imageUrl, completed: nil)
    }
    
    func  set(name: String){   
        userNameTextField.text = name
        if name.isEmpty{
            userNameTextField.leftImage = UIImage(systemName: "person.circle.fill")
        }
        else{
            userNameTextField.leftImage = UIImage(systemName: "person.crop.circle.fill.badge.checkmark")
        }
    }
    
    func set(mobile: String){
        userMobileTextField.text = mobile
        if mobile.isEmpty {
            userMobileTextField.leftImage = UIImage(named: "phone.down.circle")
        }
        else if !(viewModel?.isValid(mobileNumber: mobile) ?? false){
            userMobileTextField.leftImage = UIImage(systemName: "multiply.circle.fill")
        }
        else{
            userMobileTextField.leftImage = UIImage(systemName: "checkmark.circle.fill")
        }
    }
    
    func set(email: String){
        userEmailTextField.text = email
        if email.isEmpty {
            userEmailTextField.leftImage = UIImage(systemName: "envelope.circle.fill")
        }
        else if !(viewModel?.isValid(email: email) ?? false){
            userEmailTextField.leftImage = UIImage(systemName: "multiply.circle.fill")
        }
        else{
            userEmailTextField.leftImage = UIImage(systemName: "checkmark.circle.fill")
        }
    }
    
}

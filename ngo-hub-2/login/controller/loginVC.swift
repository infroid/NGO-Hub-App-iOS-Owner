//
//  loginVC.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 25/10/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit

class loginVC: UIViewController {
    
    var visibility = false
    let togglePwdBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!{
        didSet{
            togglePwdBtn.setImage(UIImage(named: "visibility_on"), for: .normal)
            togglePwdBtn.addTarget(self, action: #selector(toggleVisibility), for: .touchUpInside)
            passwordTF.rightView = togglePwdBtn
            passwordTF.rightViewMode = .always
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        // validate if password field is empty or not
        guard let password = passwordTF.text , passwordTF.text?.characters.count != 0 else{
            return
            //if password is empty furter code will not executed
        }
        guard let email = usernameTF.text , usernameTF.text?.characters.count != 0 && (usernameTF.text?.isValidEmail())! else{
            return
        }
    }
    
    //toggle password field visibility
    @objc func toggleVisibility(){
        visibility = !visibility
        if(visibility == true) {
            passwordTF.isSecureTextEntry = false
            togglePwdBtn.setImage(UIImage(named: "visibility_off"), for: .normal)
            
        } else {
            passwordTF.isSecureTextEntry = true
            togglePwdBtn.setImage(UIImage(named: "visibility_on"), for: .normal)
        }
        if let textRange = passwordTF.textRange(from: passwordTF.beginningOfDocument, to: passwordTF.endOfDocument) {
            passwordTF.replace(textRange, withText: passwordTF.text!)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  registerVC.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 25/10/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit

class registerVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var selectedCountry: Country!
    var selectedState : State!
    var selectedCity : City!
    var filteredStateArray: [State] = []
    var filteredCityArray: [City] = []
    var confirm_visibility = false
    var visibility = false
    let togglePwdBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    let toggleConfirmPwdBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryBtn: UIButton!
    @IBOutlet weak var stateBtn: UIButton!
    @IBOutlet weak var cityBtn: UIButton!
    @IBOutlet weak var tagBackview: DesignabelView!
    @IBOutlet weak var selectTag: UITableView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateBackView: DesignabelView!
    @IBOutlet weak var selectState: UITableView!
    @IBOutlet weak var cityBackView: DesignabelView!
    @IBOutlet weak var selectCity: UITableView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var purposeTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var secondaryPhoneTF: UITextField!
    @IBOutlet weak var webTF: UITextField!
    
    //toggle countries dropdown
    @IBAction func showtableView(_ sender: Any) {
        
        selectTag.isHidden = !selectTag.isHidden
        tagBackview.isHidden = !tagBackview.isHidden
        if !selectTag.isHidden{
            selectState.isHidden = true
            stateBackView.isHidden = true
            selectCity.isHidden = true
            cityBackView.isHidden = true
        }
        
    }
   //toggle states dropdown
    @IBAction func showStateTableView(_ sender: Any) {
        
        selectState.isHidden = !selectState.isHidden
        stateBackView.isHidden = !stateBackView.isHidden
        if !selectState.isHidden{
            selectTag.isHidden = true
            tagBackview.isHidden = true
            selectCity.isHidden = true
            cityBackView.isHidden = true
        }
        
    }
   //toggle cities dropdown
    @IBAction func showCityTableView(_ sender: Any) {
        
        selectCity.isHidden = !selectCity.isHidden
        cityBackView.isHidden = !cityBackView.isHidden
        if !selectCity.isHidden{
            selectState.isHidden = true
            stateBackView.isHidden = true
            selectTag.isHidden = true
            tagBackview.isHidden = true
        }
        
    }
   //customise password filed to add toggle visibility btn
    @IBOutlet weak var confirmPwdTF: UITextField!{
        didSet{
            toggleConfirmPwdBtn.setImage(UIImage(named: "visibility_on"), for: .normal)
            toggleConfirmPwdBtn.addTarget(self, action: #selector(toggleConfirmVisibility), for: .touchUpInside)
            confirmPwdTF.rightView = toggleConfirmPwdBtn
            confirmPwdTF.rightViewMode = .always
        }
    }
    
    //customise password filed to add toggle visibility btn
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
        selectTag.delegate = self
        selectTag.dataSource = self
        selectState.delegate = self
        selectState.dataSource  = self
        selectCity.delegate = self
        selectCity.dataSource  = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.selectTag{
        return GlobalVariables.countryArr.count
        }
        if tableView == self.selectState{
            return filteredStateArray.count
        }
        if tableView == self.selectCity{
            return filteredCityArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.selectTag{
        if let cell = tableView.dequeueReusableCell(withIdentifier: "select") as? selectTagTableViewCell{
            let country = GlobalVariables.countryArr[indexPath.row]
            cell.selectTagLabel.text = country.name
            return cell
        }
        }
        if tableView == self.selectState{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "select") as? selectTagTableViewCell{
                let state = filteredStateArray[indexPath.row]
                cell.selectTagLabel.text = state.name
                return cell
            }
        }
        if tableView == self.selectCity{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "select") as? selectTagTableViewCell{
                let city = filteredCityArray[indexPath.row]
                cell.selectTagLabel.text = city.name
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.selectTag{
        selectedCountry = GlobalVariables.countryArr[indexPath.row]
        countryLabel.text =  selectedCountry.name
        selectTag.isHidden = true
        tagBackview.isHidden = true
        self.filteredStateArray = GlobalVariables.stateArr.filter {
            $0.country_id == "\(selectedCountry.id!)"
        }
            
            selectState.reloadData()
            selectedCity = nil
            stateLabel.text = "State"
            stateBtn.isEnabled = true
            cityBtn.isEnabled = false
            filteredCityArray = []
            selectCity.reloadData()
            cityLabel.text = "City"
            
        }
        if tableView == self.selectState{
            selectedState = filteredStateArray[indexPath.row]
            stateLabel.text =  selectedState.name
            selectState.isHidden = true
            stateBackView.isHidden = true
            self.filteredCityArray = GlobalVariables.cityArr.filter {
                $0.state_id ==  "\(selectedState.id!)"
            }
            print(selectedState.id!)
            print(GlobalVariables.cityArr.count)
            print(filteredCityArray.count)
            selectCity.reloadData()
            cityLabel.text = "City"
            cityBtn.isEnabled = true
            
        }
        if tableView == self.selectCity{
            selectedCity = filteredCityArray[indexPath.row]
            cityLabel.text = selectedCity.name
            selectCity.isHidden = true
            cityBackView.isHidden = true
        }
        
    }
    //Action for signup btn
    @IBAction func signUpBtnPressed(_ sender: Any) {
        //include textfield input validation for name , email, phone , url and empty fileds
        guard let name = nameTF.text , nameTF.text?.characters.count != 0 else{
            return
        }
        guard let password = passwordTF.text , passwordTF.text?.characters.count != 0 else{
            return
        }
        guard let confirmPassword = confirmPwdTF.text , confirmPwdTF.text?.characters.count != 0 else{
            return
        }
        guard let email = emailTF.text , emailTF.text?.characters.count != 0 && (emailTF.text?.isValidEmail())! else{
            return
        }
        guard let purpose = purposeTF.text , purposeTF.text?.characters.count != 0 else{
            return
        }
        guard let description = descriptionTF.text , descriptionTF.text?.characters.count != 0 else{
            return
        }
        guard let phone = phoneTF.text , phoneTF.text?.characters.count != 0 && (phoneTF.text?.isPhoneNumber)! else{
            return
        }
        guard let secondaryPhone = secondaryPhoneTF.text , secondaryPhoneTF.text?.characters.count != 0 && (secondaryPhoneTF.text?.isPhoneNumber)! else{
            return
        }
        guard let website = webTF.text , webTF.text?.characters.count != 0 && (webTF.text?.isValidURL)! else{
            return
        }
        print("Validated")
        
    }
    
    //toggle visibility of confirm password field
    @objc func toggleConfirmVisibility(){
        confirm_visibility = !confirm_visibility
        if(confirm_visibility == true) {
            confirmPwdTF.isSecureTextEntry = false
            toggleConfirmPwdBtn.setImage(UIImage(named: "visibility_off"), for: .normal)
            
        } else {
            confirmPwdTF.isSecureTextEntry = true
            toggleConfirmPwdBtn.setImage(UIImage(named: "visibility_on"), for: .normal)
        }
        if let textRange = confirmPwdTF.textRange(from: confirmPwdTF.beginningOfDocument, to: confirmPwdTF.endOfDocument) {
            confirmPwdTF.replace(textRange, withText: confirmPwdTF.text!)
        }
    }
    
    //toggle visibility of password field
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
 

}

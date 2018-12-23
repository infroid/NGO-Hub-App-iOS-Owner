//
//  reachOutVC.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 01/11/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit

class reachOutVC: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var cityBackView: DesignabelView!
    @IBOutlet weak var selectCity: UITableView!
    @IBOutlet weak var messageTF: UITextView!
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
    @IBOutlet weak var titleView: UIView!{
        didSet{
            titleView.backgroundColor = UIColor(rgb: 0xFF4C8B)
            
        }
    }
    
    @IBOutlet weak var reachBtn: UIButton!{
        didSet{
            reachBtn.addTarget(self, action: #selector(reachBtnPressed), for: .touchUpInside)
        }
    }
    @IBAction func sideMenuBtn(_ sender: Any) {
        let revealController = self.revealViewController() as! RevealViewController
        revealController.reveal(sender as AnyObject)
    }
    //toggle country dropdown
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
   
    //toggle state dropdown
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
    //toggle city dropdown
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
   
    var reachOut : Bool = false
    var selectedCountry: Country!
    var selectedState : State!
    var selectedCity : City!
    var filteredStateArray: [State] = []
    var filteredCityArray: [City] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        selectTag.delegate = self
        selectTag.dataSource = self
        selectState.delegate = self
        selectState.dataSource  = self
        selectCity.delegate = self
        selectCity.dataSource  = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //toggle check box
    @objc func reachBtnPressed(){
        if !reachOut{
            reachBtn.setImage(UIImage(named: "filled_check"), for: .normal)
        }
        else{
            reachBtn.setImage(UIImage(named: ""), for: .normal)
        }
        reachOut = !reachOut
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
            //filter states on basis on country selected
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
            //filter cities on basis on state selected
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

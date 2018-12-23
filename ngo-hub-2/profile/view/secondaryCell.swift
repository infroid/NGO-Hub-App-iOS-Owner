//
//  secondaryCell.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 01/11/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit

class secondaryCell: UITableViewCell, UITableViewDelegate,UITableViewDataSource  {

    
    @IBOutlet weak var tagBackview: DesignabelView!
    @IBOutlet weak var selectTag: UITableView!
    @IBOutlet weak var orientationLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var staffingLabel: UILabel!
    @IBOutlet weak var fundingLabel: UILabel!
    @IBOutlet weak var fundAcceptanceLabel: UILabel!
    @IBOutlet weak var legalStatusLabel: UILabel!
    
    @IBOutlet weak var overheadTF: UITextField!
    let orientationArr = ["Charitable","Service","Participatory","Empowering"]
    let levelArr = ["Community based", "City wide", "State Ngo", "National Ngo", "International Ngo"]
    let activityArr = ["Operational", "Campaigning", "Both Operational & Campaigning", "Public Relations", "Project Management"]
    let staffingArr = ["Volunteers", "Paid Staff", "Both Volunteers & Paid Staff"]
    let fundingArr = ["High (>= US $ 1 Billion)", "Medium (>= US $ 1 Million)", "Low (< US $ 1 Million)"]
    let fundAcceptanceArr = ["Government", "Firms / Companies / Organizations", "Individual", "Other Ngos"]
    let legalStatusArr = ["Unincorporated & Voluntary Association", "Trust, Charities & Foundations", "Companies not just for profit", "Entities formed or registered under special Ngo or Non Profit Laws"]
    
    let selectedLabel = ["orientation" , "level" , "activity" , "staffing" , "funding" , "fundAcceptance" , "legalStatus"]
    var tagArr = [String]()
    var selectedField = ""
    
    @IBAction func orientationBtn(_ sender: Any) {
        selectedField = selectedLabel[0]
        tagArr = orientationArr
        selectTag.reloadData()
        showtableView()
        
    }
    
    
    @IBAction func levelBtn(_ sender: Any) {
        selectedField = selectedLabel[1]
        tagArr = levelArr
        selectTag.reloadData()
        showtableView()
    }
    
    @IBAction func activityBtn(_ sender: Any) {
        selectedField = selectedLabel[2]
        tagArr = activityArr
        selectTag.reloadData()
        showtableView()
        
    }
    
    @IBAction func staffingBtn(_ sender: Any) {
        selectedField = selectedLabel[3]
        tagArr = staffingArr
        selectTag.reloadData()
        showtableView()
        
    }
    
    @IBAction func fundingBtn(_ sender: Any) {
        selectedField = selectedLabel[4]
        tagArr = fundingArr
        selectTag.reloadData()
        showtableView()
    }
    
    
    @IBAction func fundAcceptanceBtn(_ sender: Any) {
        selectedField = selectedLabel[5]
        tagArr = fundAcceptanceArr
        selectTag.reloadData()
        showtableView()
    }
    
    @IBAction func legalStatusBtn(_ sender: Any) {
        selectedField = selectedLabel[6]
        tagArr = legalStatusArr
        selectTag.reloadData()
        showtableView()
    }
    
    
    
    @objc func showtableView() {
        
        selectTag.isHidden = !selectTag.isHidden
        tagBackview.isHidden = !tagBackview.isHidden
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectTag.delegate = self
        selectTag.dataSource = self
        selectTag.register(UINib(nibName: "tagCell", bundle: nil), forCellReuseIdentifier: "tagCell")
        // Initialization code
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tagArr.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tagCell") as? tagCell{
            cell.tagLabel.text = tagArr[indexPath.row]
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        switch selectedField {
        case selectedLabel[0]:
            orientationLabel.text = tagArr[indexPath.row]
        case selectedLabel[1]:
            levelLabel.text = tagArr[indexPath.row]
        case selectedLabel[2]:
            activityLabel.text = tagArr[indexPath.row]
        case selectedLabel[3]:
            staffingLabel.text = tagArr[indexPath.row]
        case selectedLabel[4]:
            fundingLabel.text = tagArr[indexPath.row]
        case selectedLabel[5]:
            fundAcceptanceLabel.text = tagArr[indexPath.row]
        case selectedLabel[6]:
            legalStatusLabel.text = tagArr[indexPath.row]
        default:
            print("invalid case")
        }
        selectTag.isHidden = true
        tagBackview.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

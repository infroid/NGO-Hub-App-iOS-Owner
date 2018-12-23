//
//  stateVC.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 18/11/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit

class stateVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    
    let colorArray = [Constants.RGB(145, 235, 253), Constants.RGB(198, 255, 150), Constants.RGB(254, 248, 150), Constants.RGB(253, 210, 147)]
    let dataArray = ["iPhone6", "iPhone6 Plus", "iPhone6s", "Redmi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "pieCell", bundle: nil), forCellReuseIdentifier: "pieCell")
        tableView.register(UINib(nibName: "volunteerCell", bundle: nil), forCellReuseIdentifier: "volunteerCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 332
        }
        return UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        return colorArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "pieCell") as? pieCell{
                return cell
            }
        }
        else{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "volunteerCell") as? volunteerCell{
                cell.colorView.backgroundColor = colorArray[indexPath.row]
                cell.nameLabel.text = dataArray[indexPath.row]
                return cell
            }
        }
        return UITableViewCell()
    }

}

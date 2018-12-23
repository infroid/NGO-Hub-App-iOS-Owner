//
//  leaderboardVC.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 01/12/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit

class leaderboardVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    //toggle side menu
    @IBAction func sideMenuBtn(_ sender: Any) {
        let revealController = self.revealViewController() as! RevealViewController
        revealController.reveal(sender as AnyObject)
    }
    //titleView: custom view to replace navigation bar
    @IBOutlet weak var titleView: UIView!{
        didSet{
            titleView.backgroundColor = UIColor(rgb: 0xFF4C8B)
            
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //array to store requests from api callback
    var requestArr = [Request]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "leaderCell", bundle: nil), forCellReuseIdentifier: "leaderCell")
        tableView.register(UINib(nibName: "leaderboardCell", bundle: nil), forCellReuseIdentifier: "leaderboardCell")
        tableView.register(UINib(nibName: "headerCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 166
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.sectionFooterHeight = 0
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    
    //function to call fetchRequests returns array of requests as output
    fileprivate func fetchData() {
        Service.shared.fetchNgo{ (requests, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            self.requestArr =  requests ?? []
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
            return UITableViewAutomaticDimension
       
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section{
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? headerCell{
                cell.headerLabel.text = "Top 10"
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as? headerCell{
                cell.headerLabel.text = "Top 50"
                return cell
            }
            
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 248
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
        return requestArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "leaderCell") as? leaderCell{
            return cell
        }
        }
        else{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "leaderboardCell") as? leaderboardCell{
                let req = requestArr[indexPath.row]
                cell.request = req
                return cell
            }
        }
        return UITableViewCell()
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

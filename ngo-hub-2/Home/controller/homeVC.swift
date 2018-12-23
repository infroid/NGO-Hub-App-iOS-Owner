//
//  homeVC.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 25/10/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit

class homeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
        tableView.register(UINib(nibName: "recentCell", bundle: nil), forCellReuseIdentifier: "recentCell")
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 391
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    
    //function to call fetchRequests returns array of requests as output
    fileprivate func fetchData() {
        Service.shared.fetchRequests{ (requests, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            self.requestArr =  requests ?? []
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "recentCell") as? recentCell{
                    let request = requestArr[indexPath.row]
                    cell.request = request
                    return cell
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

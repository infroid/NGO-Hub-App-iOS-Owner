//
//  secondaryVC.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 03/11/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit

class secondaryVC: UIViewController , UITableViewDelegate,UITableViewDataSource  {
    
    
  
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 636
    tableView.register(UINib(nibName: "secondaryCell", bundle: nil), forCellReuseIdentifier: "secondaryCell")
    // Initialization code
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "secondaryCell") as? secondaryCell{
    return cell
    }
    return UITableViewCell()
    }
    
   
   
    

   
}

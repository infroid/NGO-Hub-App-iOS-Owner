//
//  primaryVC.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 03/11/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit

class primaryVC: UIViewController ,UITableViewDelegate, UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    
    var primaryDetails: PrimaryDetails!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 1010
        tableView.register(UINib(nibName: "primaryCell", bundle: nil), forCellReuseIdentifier: "primaryCell")
        fetchData()
//        if let imgData = UserDefaults.standard.value(forKey: "Profile_Image") as? Data{
//            primaryDetails.userImg = UIImage(data: imgData)
//        }
        // Initialization code
    }
    
    fileprivate func fetchData() {
        Service.shared.fetchPrimaryDetails{ (primaryDetails, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            self.primaryDetails =  primaryDetails ?? nil
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if primaryDetails != nil{
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "primaryCell") as? primaryCell{
            cell.userImgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userImgTapped)))
            cell.primaryDetails = primaryDetails
            return cell
        }
        return UITableViewCell()
    }
   
    
    //userImgTapped - for selecting image from gallery
    @objc func userImgTapped(){
       
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            print("Button capture")
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        primaryDetails.userImg = chosenImage
        let imgData = UIImagePNGRepresentation(primaryDetails.userImg!)
        UserDefaults.standard.set(imgData, forKey: "Profile_Image")
        
        tableView.reloadData()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "update_image"), object: nil)
        let userInfo : [String: UIImage] = ["image" : primaryDetails.userImg!]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "update_image"), object: nil, userInfo: userInfo)
        dismiss(animated: true, completion: nil)
    }
}

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



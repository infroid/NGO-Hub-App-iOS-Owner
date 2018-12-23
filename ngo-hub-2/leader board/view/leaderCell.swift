//
//  leaderCell.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 01/12/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import UIKit

class leaderCell: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {

    
    
    var requestArr = [Request]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "leaderCollectionCell", bundle: nil), forCellWithReuseIdentifier: "leaderCollectionCell")
        if let flowLayout = collectionView.collectionViewLayout as?  UICollectionViewFlowLayout{
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
            
        }
        collectionView.isPagingEnabled = true
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
            self.collectionView.reloadData()
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.width, height: self.bounds.height)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return requestArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leaderCollectionCell", for: indexPath) as? leaderCollectionCell{
            let req = requestArr[indexPath.row]
            cell.request = req
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

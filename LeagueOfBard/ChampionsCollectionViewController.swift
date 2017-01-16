//
//  ChampionsCollectionViewController.swift
//  LeagueOfBard
//
//  Created by iMacFabLab on 10/01/2017.
//  Copyright © 2017 iMacFabLab. All rights reserved.
//

import UIKit
import SwiftyJSON
import AlamofireImage

class ChampionsCollectionViewController: UICollectionViewController {
    
    
    var champions = [Champion] () {
        didSet{
            self.collectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        
        
        
        NetworkManager.sharedInstance.callApi { (data: JSON, error: Error?) in
            //print("Recived data \(data)")
            var gloobalDict = data["data"]
            //as! [String: Any]
            
            for element in gloobalDict {
                //print(" element is \(element.1)")
                self.champions.append(Champion(json: element.1))
            }
            
            print("\(self.champions)")
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.champions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ChampionsCollectionViewCell
        
        
        let sortedArray = champions.sorted {
            $0.name < $1.name
        }
        let currentChampion = sortedArray[indexPath.row]
        cell.championLabel.text = currentChampion.name
        print(currentChampion.getImageURL())
        cell.championImageView.af_setImage(withURL: URL(string: currentChampion.getImageURL())!)
    
        return cell
    }
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */



}

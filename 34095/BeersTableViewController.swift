//
//  BeersTableViewController.swift
//  34095
//
//  Created by jose on 05/12/17.
//  Copyright © 2017 jose. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftGifOrigin

class BeersTableViewController: UITableViewController {

  
    @IBOutlet weak var imgLoad: UIImageView!
    
    lazy var listBeer = [Beer]()
    var beerTap: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgLoad.image = UIImage.gif(name: "loader");

        PunkAPI.getBeers { beerListResult in
            guard let beers = beerListResult else { return }
        
            DispatchQueue.main.async {
                
                self.listBeer = beers;
                self.tableView.reloadData();
                
                //js
                
                self.setTimeout(4, block: { () -> Void in
                  self.imgLoad.isHidden = true;
                })
                

                
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBeer.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "beerCell", for: indexPath) as! BeerTableViewCell
        
        let url = ImageResource(downloadURL: URL(string: listBeer[indexPath.row].imageURL)!,
                                cacheKey: listBeer[indexPath.row].name)
        
        let abv = String(format: "%.1f", listBeer[indexPath.row].abv )
        
        cell.imgBeer.kf.setImage(with: url)
        cell.tfName.text = listBeer[indexPath.row].name
        cell.tfABV.text = "Teor alcoólico: \(abv)"
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        beerTap = listBeer[indexPath.row]
        performSegue(withIdentifier: "sgcerveja", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgcerveja" {
            let beerVC = segue.destination as! BeerViewController
            beerVC.beer = self.beerTap
        }
    }
    
    func setTimeout(_ delay:TimeInterval, block:@escaping ()->Void) -> Timer {
        return Timer.scheduledTimer(timeInterval: delay, target: BlockOperation(block: block), selector: #selector(Operation.main), userInfo: nil, repeats: false)
    }
    


}

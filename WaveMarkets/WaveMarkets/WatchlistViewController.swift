//
//  WatchlistViewController.swift
//  WaveMarkets
//
//  Created by Adrian Reyes on 5/14/25.
//

import UIKit

class WatchlistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return watchListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WatchlistCell", for: indexPath)
        let item = watchListItems[indexPath.row]
        cell.textLabel?.text = item.symbol
        cell.detailTextLabel?.text = "$\(item.price)"
        
        return cell
    }
  
    // table view for the watchList
    
   
    
    
  
    
    var watchListItems: [WatchlistItem] = []
    
    
    
  
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // load the watchlist
        listView.dataSource = self
        listView.delegate = self
        
        watchListItems = loadWatchList()
        listView.reloadData()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}




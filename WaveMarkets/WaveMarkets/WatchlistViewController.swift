//
//  WatchlistViewController.swift
//  WaveMarkets
//
//  Created by Adrian Reyes on 5/14/25.
//

import UIKit


class WatchlistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var watchList: [Stocks] = []
    
    @IBOutlet weak var watchListTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return watchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WatchlistCell", for: indexPath) as! StockCell
        
        // get the stock associated with the table view row
        let stock = watchList[indexPath.row]
        
        //configure the cell (update the elements and labels )
        cell.textLabel?.text = stock.symbol
        cell.detailTextLabel?.text = "$\(stock.price)"
        
        return cell
    }
  
    
   
    

    
    
    
  
    
    
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        // get index path for the selcted row
        
        guard let selectedIndexPath = watchListTableView.indexPathForSelectedRow else {return}
        
        // get the selected stock from the list and use the the selected index's path's row
        let selectedStock = watchList[selectedIndexPath.row]
        
        // get access to the watchlist view controller via the segue's destination (guard to unwrap the optional)
        guard let destinationViewController = segue.destination as? DetailViewController else {return}
        
        destinationViewController.stock = selectedStock
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




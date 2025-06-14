//
//  WatchlistViewController.swift
//  WaveMarkets
//
//  Created by Adrian Reyes on 5/14/25.
//

import UIKit


class WatchlistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    @IBOutlet weak var watchListTableView: UITableView!
    
    
    var watchList: [Stock] = []
    
    
    // sets up the table view delegate and data source
    // configures the nav bar title
    // runs once the view controller is first loaded
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        watchListTableView.dataSource = self
        watchListTableView.delegate = self
        
        
        
    }
    
    // reloads the watchList from UserDefaults
    // Refreshes the table view with .reloadData()
    // Runs every time you return to watchlist screen
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        // load the watchlist from UserDefaults
        watchList = Stock.getStocks(forKey: Stock.watchListKey)
        
        // reload the table view with the updated data
        watchListTableView.reloadData()
    }
    
    
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return watchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WatchListCell", for: indexPath) as! StockCell
        
        // get the stock associated with the table view row
        let stock = watchList[indexPath.row]
        
        //configure the cell (update the elements and labels )
        cell.symbolLabel?.text = stock.symbol
        cell.priceLabel.text = "$\(stock.price)"
        
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



// An extension to group all table view data source related methods

extension WatchlistViewController {
    
    //Enable "Swipe to Delete " Functionality . THe existance of this data source method  enables the default "Swipe to delete "
    //1. Handle the "delete" case:
    // 2. Remove theh associated stock sybmol from the watchlist array
    // 3. Save the updated watchlist array
    // 4. Tell the table view to delete the associated row
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        // 1.
        if editingStyle == .delete {
            //2.
            watchList.remove(at: indexPath.row)
            // Unselect the favorite button for that stock
            
            // 3.
            Stock.save(watchList, forKey: "watchList")
            //4.
            tableView.deleteRows(at: [indexPath], with: .automatic )
            
        }
    }
    
}






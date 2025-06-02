//
//  ViewController.swift
//  WaveMarkets
//
//  Created by Adrian Reyes on 4/18/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return number of rows for table
        return stockList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create , configure , and return a table view cell for the given row
        // create cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockCell", for: indexPath) as! StockCell
        let stock = stockList[indexPath.row]
        // configure cell
        cell.symbolLabel?.text = stock.symbol        // get the row where the cell will be placed using row property
        cell.priceLabel?.text  = "$\(String(format: "%.2f", stock.price))"
        // return the cell for use in respective table view row
        return cell
    }
    
    // override func to pass the detail screen data from the selected stock in the table view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetailView"{ // storyboard segue id identifier
            let destinationVC = segue.destination as! DetailViewController
            if let indexPath = tableView.indexPathForSelectedRow{
                destinationVC.stock = stockList[indexPath.row]
            }
            
        }
        
    }
    
   
    
    @IBOutlet weak var streamLabel: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


//
//  DetailViewController.swift
//  WaveMarkets
//
//  Created by Adrian Reyes on 4/22/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var SymbolLabel: UILabel!
    

    @IBOutlet weak var PriceLabel: UILabel!
    
    
    @IBOutlet weak var VolumeValueLabel: UILabel!
    
    
    @IBOutlet weak var HighPriceLabel: UILabel!
    
    @IBOutlet weak var LowPriceLabel: UILabel!
    
    @IBOutlet weak var ClosePriceLabel: UILabel!
    
    
    @IBOutlet weak var AddToWatchListButton: UIButton!
    
    
    // Action when AddToWatchListButton is tapped
    
    @IBAction func didTapAddToWatchlistButton(_ sender: UIButton) {
        
        // set the button's isSelected state to the opposite of its current value
        sender.isSelected  = !sender.isSelected
        
        //1 . if the button is in the *selected* state -> add the stock to the watchlist
        
        if sender.isSelected{
            stock.addToWatchList()
        }
        //2. otherwise, the button is in the *un-selected* state -> remove the stock from the watchlist
        else {
            stock.removeFromWatchlist()
        }
        
    
    }
    
    
    
    
    
    
    // property to store the stock
    var stock: Stock!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // configure labels in detail view
        SymbolLabel.text = stock?.symbol
        
        PriceLabel.text = "\(String(stock.price))"
        VolumeValueLabel.text = "Volume: \(String(stock.volume))"
        HighPriceLabel.text = "High: \(String(stock.high))"
        LowPriceLabel.text = "Low: \(String(stock.low))"
        ClosePriceLabel.text = "Close: \(String(stock.close))"
        
        
        
    

        // Do any additional setup after loading the view.
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







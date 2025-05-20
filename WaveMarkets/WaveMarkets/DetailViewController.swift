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
        // set the button's state to the opposite of its current
        // value
        sender.isSelected = !sender.isSelected
        // get the symbol and price from the current stock and unwrap it safely
        guard let stock = stock,
              let symbol = stock.symbol.first else { return }
        
        let stockEquity = WatchlistItem(symbol: symbol, price: stock.price)
        
        // load the watchlist
        var currentWatchList = loadWatchList()
        
        // check and prevent duplicates
        if !currentWatchList.contains(where: { $0.symbol == stockEquity.symbol}){
            currentWatchList.append(stockEquity)
            saveWatchList(currentWatchList)
            
            
            // display alert that stock has been added to watchlist
            
            let alert = UIAlertController(title: "Added!", message: "\(symbol) added  to Watchlist!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
            print(currentWatchList)
        }
    
        
        
    }
    
    
    // function to save watchlist
    func saveWatchList(_ list: [WatchlistItem]){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(list){
            UserDefaults.standard.set(encoded, forKey: "watchlist")
        }
        
    }
    
    // function to load the watchlist
    
    func loadWatchList() -> [WatchlistItem] {
        if let data = UserDefaults.standard.data(forKey: "watchlist"){
            let decoder = JSONDecoder()
            if let list = try? decoder.decode([WatchlistItem].self, from: data){
                return list
            }
        }
        return []
    }
    
    
    func RemoveFromWatchList(_ symbol: String){
        // get all watchlist from user defaults
       
    }
    
    
    
    // property to store the stock
    var stock: Stocks!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // configure labels in detail view
        SymbolLabel.text = stock?.symbol.first
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

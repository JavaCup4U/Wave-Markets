//
//  Stocks.swift
//  WaveMarkets
//
//  Created by Adrian Reyes on 4/21/25.
//

import Foundation
import UIKit


struct StockFeed: Decodable{
    let results: [Stock]
}




    //create mock data
struct Stock : Codable,  Equatable {
    let price: Double
    let symbol: String
    let volume : Double
    let high : Double
    let low : Double
    let close : Double
  
    
    
    
   
}




// a list of stocks that has their own data

let stockList: [Stock] = [
    Stock(price: 600.00, symbol: "SPY", volume: 200212929.90, high: 601.50, low: 599.00, close: 600.26),
        Stock(price: 200.01, symbol: "AAPL", volume: 103903930.78, high: 200.90, low: 198.10, close: 200.34),
        Stock(price: 320.45, symbol: "MSFT", volume: 98344823.45, high: 322.00, low: 319.00, close: 321.67),
        Stock(price: 170.33, symbol: "TSLA", volume: 145893221.20, high: 172.40, low: 168.50, close: 171.22),
        Stock(price: 95.12, symbol: "NFLX", volume: 75839220.35, high: 96.75, low: 94.80, close: 95.90),
        Stock(price: 125.89, symbol: "AMZN", volume: 158320000.10, high: 127.00, low: 124.20, close: 126.50),
        Stock(price: 48.77, symbol: "GME", volume: 90847213.33, high: 50.00, low: 47.30, close: 49.10),
        Stock(price: 39.55, symbol: "F", volume: 87239310.00, high: 40.20, low: 38.90, close: 39.80),
        Stock(price: 89.43, symbol: "NVDA", volume: 138482939.22, high: 91.00, low: 88.10, close: 90.25),
        Stock(price: 210.00, symbol: "META", volume: 110938332.12, high: 211.50, low: 208.75, close: 209.60),
        Stock(price: 151.32, symbol: "INTC", volume: 74383920.45, high: 153.00, low: 149.75, close: 150.89),
        Stock(price: 112.45, symbol: "AMD", volume: 68492038.22, high: 113.50, low: 111.10, close: 112.90),
        Stock(price: 305.67, symbol: "GOOGL", volume: 154783902.87, high: 308.20, low: 303.45, close: 306.88),
        Stock(price: 68.12, symbol: "KO", volume: 32908475.00, high: 69.00, low: 67.50, close: 68.40),
        Stock(price: 42.33, symbol: "T", volume: 48920384.12, high: 43.20, low: 41.95, close: 42.50),
        Stock(price: 78.95, symbol: "PEP", volume: 35990238.78, high: 80.10, low: 77.80, close: 79.20),
        Stock(price: 132.88, symbol: "CRM", volume: 59839203.23, high: 134.00, low: 131.40, close: 133.50),
        Stock(price: 88.21, symbol: "UBER", volume: 72019293.49, high: 89.90, low: 87.30, close: 88.75),
        Stock(price: 54.76, symbol: "LYFT", volume: 38293823.91, high: 55.80, low: 53.95, close: 54.60),
        Stock(price: 193.45, symbol: "ADBE", volume: 54829384.23, high: 195.20, low: 192.30, close: 194.00),
        Stock(price: 145.10, symbol: "BA", volume: 80932438.56, high: 146.75, low: 143.80, close: 144.90),
        Stock(price: 73.20, symbol: "WMT", volume: 67820349.88, high: 74.50, low: 72.60, close: 73.70),
        Stock(price: 67.89, symbol: "DIS", volume: 70938230.77, high: 68.90, low: 66.90, close: 68.10),
        Stock(price: 41.55, symbol: "SNAP", volume: 49382020.10, high: 42.30, low: 40.85, close: 41.75),
        Stock(price: 99.99, symbol: "ROKU", volume: 38492030.99, high: 101.10, low: 98.45, close: 100.20)
    
    
    
]



// methods for saving , retrieving , and removing from watchlist

extension Stock {
    
    // 'watchListKey ' a computed property that returns a string
    // - Use when saving / retrieving or removing from UserDefaults
    // - 'static' means this property is "Type Property" , associated with Stocks "type", not any particular instance
    // - We can access this property anywhere .. such as .. 'Stocks.watchListKey(Type property)
    
    static var watchListKey: String {
        return "watchList"
    }
    
    
    
    
    
    // save an array of the watchlist to UserDefaults
    //1. create an instance of UserDefaults
    //2.Try to encode the array of Stocks objects to Data
    //3. Save the encoded Stock "Data" to UserDefaults
    
    static func save(_ stocks: [Stock], forKey key: String ){
        //1.
        let defaults = UserDefaults.standard
        //2.
        let encodedData = try! JSONEncoder().encode(stocks)
        //3.
        defaults.set(encodedData, forKey:key)
    }
    
    // get the array of watchlist stocks from UserDefaults
    // A static type method we can call anywhere such as 'Stocks.getStocks(forKey: watchListKey)
    // 1. Create an instance of UserDefaults
    // 2. Get any watchlist stocks 'Data' saved to UserDefaults (if they exist)
    // 3. Try to decode the stocks 'Data' to 'Stocks' objects
    //4. if 2-3 are successful , return the array of stocks
    // 5. otherwise, return an emtpy array
    
    static func getStocks(forKey key: String) -> [Stock]{
        //1.
        let defaults = UserDefaults.standard
        // 2.
        if let data = defaults.data(forKey: key){
            //3.
            let decodedStocks = try! JSONDecoder().decode([Stock].self, from: data)
            // 4.
            return decodedStocks
        }
        else {
            // 5.
            return []
        }
    }
    
    
    
    
    //Adds a stock equity to the watchList array in UserDefaults
    // 1. Get all watchList stocks from UserDefaults
    // - We make 'watchList' to a 'var' so we'll be able to modify it when addding another stock
    // 2. add the stock to the watchlist array
    // - Since this method is available on "instances" of a stocks we can reference the stock this method is being called on using 'self'.
    // 3. Save the upaded watchlist array
    
    func addToWatchList(){
        //1.
        var watchList = Stock.getStocks(forKey: Stock.watchListKey)
        // 2.
        watchList.append(self)
        // 3. save the updated watchList array
        Stock.save(watchList, forKey: Stock.watchListKey)
        
    }
    
    // Removes a stock from the watchList array in UserDefaults
    // 1. get all the stocks from the UserDefaults
    //2. remove all the instances that match the stock from the watchlist array this method is being call on 'self'
    // - the removeAll method iterates throuh all the stocks in the array and passed every stock into a closure where it can be used to determine if it should be removed from the array
    //3. if a given stock passed into the closure is equal to 'self' we want to remove it . Returning a 'Bool' of 'true' removes the given stock
    // 4.Save the updated array
    
    func removeFromWatchlist(){
        //1.
        var watchListStocks = Stock.getStocks(forKey: Stock.watchListKey)
        
        // 2.
        watchListStocks.removeAll { stock in
            // 3.
            return self == stock
        }
        // 4.
        Stock.save(watchListStocks, forKey: Stock.watchListKey)
        
    }
}

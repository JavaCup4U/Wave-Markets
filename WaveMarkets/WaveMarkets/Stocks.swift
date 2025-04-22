//
//  Stocks.swift
//  WaveMarkets
//
//  Created by Adrian Reyes on 4/21/25.
//

import Foundation
import UIKit

    //create mock data
struct Stocks{
    let price: Double
    let symbol: [String]
    let volume : Double
    let high : Double
    let low : Double
    let close : Double
  
    
    
    
   
}



enum stocksInfo {
    case price
    case symbol
    case volume
    case high
    case low
    case close
    
    
  
    
}
// a list of stocks that has their own data

let stockList: [Stocks] = [
    Stocks(price: 600.00, symbol: ["SPY"], volume: 200212929.90, high: 601.50, low: 599.00, close: 600.26),
        Stocks(price: 200.01, symbol: ["AAPL"], volume: 103903930.78, high: 200.90, low: 198.10, close: 200.34),
        Stocks(price: 320.45, symbol: ["MSFT"], volume: 98344823.45, high: 322.00, low: 319.00, close: 321.67),
        Stocks(price: 170.33, symbol: ["TSLA"], volume: 145893221.20, high: 172.40, low: 168.50, close: 171.22),
        Stocks(price: 95.12, symbol: ["NFLX"], volume: 75839220.35, high: 96.75, low: 94.80, close: 95.90),
        Stocks(price: 125.89, symbol: ["AMZN"], volume: 158320000.10, high: 127.00, low: 124.20, close: 126.50),
        Stocks(price: 48.77, symbol: ["GME"], volume: 90847213.33, high: 50.00, low: 47.30, close: 49.10),
        Stocks(price: 39.55, symbol: ["F"], volume: 87239310.00, high: 40.20, low: 38.90, close: 39.80),
        Stocks(price: 89.43, symbol: ["NVDA"], volume: 138482939.22, high: 91.00, low: 88.10, close: 90.25),
        Stocks(price: 210.00, symbol: ["META"], volume: 110938332.12, high: 211.50, low: 208.75, close: 209.60),
        Stocks(price: 151.32, symbol: ["INTC"], volume: 74383920.45, high: 153.00, low: 149.75, close: 150.89),
        Stocks(price: 112.45, symbol: ["AMD"], volume: 68492038.22, high: 113.50, low: 111.10, close: 112.90),
        Stocks(price: 305.67, symbol: ["GOOGL"], volume: 154783902.87, high: 308.20, low: 303.45, close: 306.88),
        Stocks(price: 68.12, symbol: ["KO"], volume: 32908475.00, high: 69.00, low: 67.50, close: 68.40),
        Stocks(price: 42.33, symbol: ["T"], volume: 48920384.12, high: 43.20, low: 41.95, close: 42.50),
        Stocks(price: 78.95, symbol: ["PEP"], volume: 35990238.78, high: 80.10, low: 77.80, close: 79.20),
        Stocks(price: 132.88, symbol: ["CRM"], volume: 59839203.23, high: 134.00, low: 131.40, close: 133.50),
        Stocks(price: 88.21, symbol: ["UBER"], volume: 72019293.49, high: 89.90, low: 87.30, close: 88.75),
        Stocks(price: 54.76, symbol: ["LYFT"], volume: 38293823.91, high: 55.80, low: 53.95, close: 54.60),
        Stocks(price: 193.45, symbol: ["ADBE"], volume: 54829384.23, high: 195.20, low: 192.30, close: 194.00),
        Stocks(price: 145.10, symbol: ["BA"], volume: 80932438.56, high: 146.75, low: 143.80, close: 144.90),
        Stocks(price: 73.20, symbol: ["WMT"], volume: 67820349.88, high: 74.50, low: 72.60, close: 73.70),
        Stocks(price: 67.89, symbol: ["DIS"], volume: 70938230.77, high: 68.90, low: 66.90, close: 68.10),
        Stocks(price: 41.55, symbol: ["SNAP"], volume: 49382020.10, high: 42.30, low: 40.85, close: 41.75),
        Stocks(price: 99.99, symbol: ["ROKU"], volume: 38492030.99, high: 101.10, low: 98.45, close: 100.20)
    
    
    
]

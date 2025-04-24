//
//  DetailViewController.swift
//  WaveMarkets
//
//  Created by Adrian Reyes on 4/22/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var SymbolLabel: UILabel!
    
    
    @IBOutlet weak var VolumeLabel: UILabel!
    
    
    @IBOutlet weak var HighLabel: UILabel!
    
    @IBOutlet weak var LowLabel: UILabel!
    
    @IBOutlet weak var CloseLabel: UILabel!
    
    @IBOutlet weak var PriceLabel: UILabel!
    
    
    @IBOutlet weak var VolumeValueLabel: UILabel!
    
    
    @IBOutlet weak var HighPriceLabel: UILabel!
    
    @IBOutlet weak var LowPriceLabel: UILabel!
    
    @IBOutlet weak var ClosePriceLabel: UILabel!
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    

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

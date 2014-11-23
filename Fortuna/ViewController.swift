//
//  ViewController.swift
//  Fortuna
//
//  Created by Tonny on 22/10/14.
//  Copyright (c) 2014 Tonny M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func rootViewTapped(sender: UITapGestureRecognizer) {
        displayRandomQuote()
    }
    @IBOutlet weak var quotationTextView: UITextView!
    var delegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set disable for text edit
        quotationTextView.editable = false
        quotationTextView.selectable = false
        println("viewDidLoad quotationTextView: \(quotationTextView)")
        displayRandomQuote()
    }
    
    override func awakeFromNib() {
        // The super method doesn't do anything, but we call it anyway.
        super.awakeFromNib()
        println("awakeFromNib quotationTextView: \(quotationTextView)")
    }
    
    func displayRandomQuote() {
        // quotes = randomly choose positiveQuotations or negativeQuotations
        let whichType = Int(arc4random_uniform(2))
        var quotesType = delegate.negativeQuotes
        if whichType == 0 {
            println("use positiveQuotes")
            quotesType = delegate.positiveQuotes
        } else{
            println("use negativeQuotes")
        }
        // quote = randomly choose an element from quotes
        var quoteLength = quotesType.count
        var whichQuote = arc4random_uniform(UInt32(quoteLength))
        var quote = quotesType[Int(whichQuote)]
        quotationTextView.text = quote
    }

}


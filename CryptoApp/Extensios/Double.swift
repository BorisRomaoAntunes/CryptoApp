//
//  Double.swift
//  CryptoApp
//
//  Created by Boris R on 12/09/23.
//

import Foundation

extension Double {
    
    /// Converts a double into a Currency with 2-6 decimal places
    /// ```
    ///convert 1234.56 to $1,234.56
    ///convert 1214.56 to $1,214.56
    ///convert 1231.26 to $1,231.26
    /// ``
    private var currencyFormatter6: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // <- default value
//        formatter.currencyCode = "BRL" // <- change currency
//        formatter.currencySymbol = "R$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        
        return formatter
    }
    /// Converts a double into a Currency as a Strung with 2-6 decimal places
    /// ```
    ///convert 1234.56 to "$1,234.56"
    ///convert 1214.56 to "$1,214.56"
    ///convert 1231.26 to "$1,231.26"
    /// ``

    func asCurrencyWith6Decimals()->String{
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "R$0.00"
    }
    
    
    
    /// Converts a double into a Currency with 2decimal places
    /// ```
    ///convert 1234.56 to $1,234.56
    /// ``
    private var currencyFormatter2: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current // <- default value
//        formatter.currencyCode = "BRL" // <- change currency
//        formatter.currencySymbol = "R$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    /// Converts a double into a Currency as a Strung with 2 decimal places
    /// ```
    ///convert 1234.56 to "$1,234.56"
    /// ``

    func asCurrencyWith2Decimals()->String{
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "R$0.00"
    }
    
    /// Converts a double into a string representantion
    /// ```
    ///convert 1.2345 to "1,23"
    /// ``

    func asNumberString() ->String{
        return String(format: "%.2f", self)
    }
    
    func asPercentagenString() ->String{
        return asNumberString() + "%"
    }
}

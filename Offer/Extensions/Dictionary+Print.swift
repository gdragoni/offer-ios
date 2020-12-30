//
//  Dictionary+Print.swift
//  Offer
//
//  Created by Gabriel Dragoni on 30/12/20.
//

import Foundation

extension Dictionary {
    
    func printJSON() {

        if  let jsonData = try? JSONSerialization.data(withJSONObject: self),
            let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
           print(JSONString)
        } else {
            print("PRINT JSON FORMAT ERROR")
        }
    }
}

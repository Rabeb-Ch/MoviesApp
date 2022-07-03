//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by Rabeb Chelbi on 3/7/2022.
//

import Foundation

extension String {
    func getDateWithFormat(withFormat format: String) -> String? {
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy/MM/dd"
        
        if let date = inputFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format
            return outputFormatter.string(from: date)
        }
        return nil
    }
}

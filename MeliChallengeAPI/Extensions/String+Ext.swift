//
//  String+Ext.swift
//  MeliChallengeAPI
//
//  Created by Eduardo Hernandez on 12/06/23.
//

import Foundation

extension String {
    func replaceSpaces(text: String) -> String {
        return text.replacingOccurrences(of: " ", with: "&")
    }
}

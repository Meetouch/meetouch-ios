//
//  String.swift
//  DAOWorkshop
//
//  Created by Meetouch on 12/1/22.
//

import Foundation

/// MARK: - String Extension

/// This extension enhances the functionality of the `String` type by providing methods for generating
/// random names and texts, as well as capitalizing the first letter of a string.
extension String {
    
    /// Generate a random name with the preferred length.
    ///
    /// - Parameter preferredLength: The preferred length of the generated name.
    /// - Returns: A randomly generated name with alternating consonants and vowels.
    ///
    /// Example:
    /// ```
    /// let name = String.generatedName(preferredLength: 10)
    /// print(name) // Output: "bejupakoti"
    /// ```
    static func generatedName(preferredLength: Int) -> String {
        
        /// Vowels excluding 'y'
        let vowels = ["e", "a", "u", "i", "o"]
        
        /// Consonants excluding 'q'
        let consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "r", "s", "t", "v", "w", "x", "z"]
        
        return (0..<preferredLength).map { index in
            index.isMultiple(of: 2)
                ? consonants[Int.random(in: 0..<consonants.count)]
                : vowels[Int.random(in: 0..<vowels.count)]
        }.joined()
    }
    
    /// Generate a random name with the default preferred length of 8.
    ///
    /// - Returns: A randomly generated name with alternating consonants and vowels.
    ///
    /// Example:
    /// ```
    /// let name = String.generatedName
    /// print(name) // Output: "gojevumi"
    /// ```
    static var generatedName: String {
        generatedName(preferredLength: 8)
    }
}

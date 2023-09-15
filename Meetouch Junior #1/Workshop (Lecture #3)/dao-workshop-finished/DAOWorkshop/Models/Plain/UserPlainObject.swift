//
//  UserPlainObject.swift
//  DAOWorkshop
//
//  Created by Meetouch on 12/1/22.
//

import SDAO
import Foundation

// MARK: - UserPlainObject

/// @realm
public struct UserPlainObject: Plain {

    // MARK: - Properties
    
    public var uniqueId: UniqueID {
        UniqueID(rawValue: id)
    }

    /// Unique user identifier
    public let id: String

    /// Name
    public let firstName: String

    /// Surname
    public let lastName: String
}

// MARK: - Random

extension UserPlainObject {

    static func random() -> UserPlainObject {
        UserPlainObject(
            id: UUID().uuidString,
            firstName: .generatedName,
            lastName: .generatedName
        )
    }
}

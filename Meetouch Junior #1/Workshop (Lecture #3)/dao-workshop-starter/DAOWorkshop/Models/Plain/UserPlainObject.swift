//
//  UserPlainObject.swift
//  DAOWorkshop
//
//  Created by Meetouch on 12/1/22.
//

import Foundation

// MARK: - UserPlainObject

public struct UserPlainObject {

    // MARK: - Properties

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

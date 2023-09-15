//
//  ProjectPlainObject.swift
//  DAOWorkshop
//
//  Created by Meetouch on 11/30/22.
//

import SDAO
import Foundation

// MARK: - ProjectPlainObject

/// @realm
public struct ProjectPlainObject: Plain {
    
    // MARK: - Properties
    
    public var uniqueId: UniqueID {
        UniqueID(rawValue: id)
    }

    /// Project unique identifier
    public let id: String

    /// Project name
    public let name: String

    /// Status value
    public let status: ProjectStatus

    /// Total budget
    public let budget: Double

    /// Project owner
    public let owner: UserPlainObject
    
    /// Date of creation
    public let createdAt: Date
}

// MARK: - Random

extension ProjectPlainObject {

    static func random() -> ProjectPlainObject {
        ProjectPlainObject(
            id: UUID().uuidString,
            name: .generatedName.uppercased(),
            status: .allCases.randomElement().unsafelyUnwrapped,
            budget: .random(in: 100...2000) * 1000,
            owner: .random(),
            createdAt: Date()
        )
    }
}

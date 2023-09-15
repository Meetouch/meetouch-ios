//
//  ProjectModelObject.swift
//  DAOWorkshop
//
//  Generated automatically by dao-autograph
//  https://github.com/Incetro/dao-autograph
//
//  Copyright © 2020 Incetro Inc. All rights reserved.
//
// swiftlint:disable trailing_newline

import SDAO
import Foundation
import RealmSwift

// MARK: - ProjectModelObject

public final class ProjectModelObject: RealmModel {

    // MARK: - Properties

    /// Project unique identifier
    @objc dynamic public var id = ""

    /// Project name
    @objc dynamic public var name = ""

    /// Status value
    @objc dynamic public var status = 0

    /// Total budget
    @objc dynamic public var budget: Double = 0.0

    /// Project owner
    @objc dynamic public var owner: UserModelObject?

    /// Date of creation
    @objc dynamic public var createdAt = Date()
}

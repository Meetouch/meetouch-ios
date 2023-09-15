//
//  UserModelObject.swift
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

// MARK: - UserModelObject

public final class UserModelObject: RealmModel {

    // MARK: - Properties

    /// Unique user identifier
    @objc dynamic public var id = ""

    /// Name
    @objc dynamic public var firstName = ""

    /// Surname
    @objc dynamic public var lastName = ""
}

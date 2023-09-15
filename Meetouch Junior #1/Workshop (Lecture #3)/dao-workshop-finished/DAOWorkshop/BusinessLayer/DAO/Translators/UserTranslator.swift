//
//  UserTranslator.swift
//  DAOWorkshop
//
//  Generated automatically by dao-autograph
//  https://github.com/Incetro/dao-autograph
//
//  Copyright © 2020 Incetro Inc. All rights reserved.
//
// swiftlint:disable trailing_newline

import SDAO
import Monreau
import Foundation

// MARK: - UserTranslator

public final class UserTranslator {

    // MARK: - Aliases

    public typealias PlainModel = UserPlainObject
    public typealias DatabaseModel = UserModelObject

    /// User storage
    private lazy var userStorage = RealmStorage<UserModelObject>(configuration: self.configuration)

    /// RealmConfiguration instance
    private let configuration: RealmConfiguration

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - configuration: current realm db config
    public init(configuration: RealmConfiguration) {
        self.configuration = configuration
    }
}

// MARK: - Translator

extension UserTranslator: Translator {

    public func translate(model: DatabaseModel) throws -> PlainModel {
        UserPlainObject(
            id: model.id,
            firstName: model.firstName,
            lastName: model.lastName
        )
    }

    public func translate(plain: PlainModel) throws -> DatabaseModel {
        let model = try userStorage.read(byPrimaryKey: plain.uniqueId.rawValue) ?? DatabaseModel()
        try translate(from: plain, to: model)
        return model
    }

    public func translate(from plain: PlainModel, to databaseModel: DatabaseModel) throws {
        if databaseModel.uniqueId.isEmpty {
            databaseModel.uniqueId = plain.uniqueId.rawValue
        }
        databaseModel.id = plain.id
        databaseModel.firstName = plain.firstName
        databaseModel.lastName = plain.lastName
    }
}
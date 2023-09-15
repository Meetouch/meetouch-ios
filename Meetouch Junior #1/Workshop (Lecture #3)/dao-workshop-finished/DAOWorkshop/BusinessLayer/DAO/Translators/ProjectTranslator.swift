//
//  ProjectTranslator.swift
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

// MARK: - ProjectTranslator

public final class ProjectTranslator {

    // MARK: - Aliases

    public typealias PlainModel = ProjectPlainObject
    public typealias DatabaseModel = ProjectModelObject

    /// Project storage
    private lazy var projectStorage = RealmStorage<ProjectModelObject>(configuration: self.configuration)

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

extension ProjectTranslator: Translator {

    public func translate(model: DatabaseModel) throws -> PlainModel {
        guard let owner = model.owner else {
            throw NSError(
                domain: "com.incetro.user-translator",
                code: 1000,
                userInfo: [
                    NSLocalizedDescriptionKey: "Cannot find UserModelObject instance for ProjectPlainObject with id: '\(model.uniqueId)'"
                ]
            )
        }
        return ProjectPlainObject(
            id: model.id,
            name: model.name,
            status: ProjectStatus(rawValue: model.status).unsafelyUnwrapped,
            budget: model.budget,
            owner: try UserTranslator(configuration: configuration).translate(model: owner),
            createdAt: model.createdAt
        )
    }

    public func translate(plain: PlainModel) throws -> DatabaseModel {
        let model = try projectStorage.read(byPrimaryKey: plain.uniqueId.rawValue) ?? DatabaseModel()
        try translate(from: plain, to: model)
        return model
    }

    public func translate(from plain: PlainModel, to databaseModel: DatabaseModel) throws {
        if databaseModel.uniqueId.isEmpty {
            databaseModel.uniqueId = plain.uniqueId.rawValue
        }
        databaseModel.id = plain.id
        databaseModel.name = plain.name
        databaseModel.status = plain.status.rawValue
        databaseModel.budget = plain.budget
        databaseModel.owner = try UserTranslator(configuration: configuration).translate(plain: plain.owner)
        databaseModel.createdAt = plain.createdAt
    }
}
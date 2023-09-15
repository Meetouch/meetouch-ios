//
//  ProjectListItemState.swift
//  DAOWorkshop
//
//  Created by Meetouch on 12/1/22.
//

import Foundation

// MARK: - ProjectItemState

public struct ProjectItemState: Equatable, Identifiable {

    // MARK: - Properties

    public let id: String
    public let name: String
    public let budget: Double
    public let hexColorString: String
    public let hexBorderColorString: String
    public let hexContrastColor: String
    public let ownerName: String

    public var priceText: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.numberStyle = .decimal
        let price = formatter.string(from: NSNumber(value: Int(budget))) ?? ""
        return "\(price) $"
    }
}

// MARK: - Initializers

extension ProjectItemState {

    init(from project: ProjectPlainObject) {
        self.id = project.id
        self.name = project.name
        self.budget = project.budget
        self.hexColorString = project.status.hexColor
        self.hexBorderColorString = project.status.hexBorderColor
        self.hexContrastColor = project.status.hexContrastColor
        self.ownerName = project.owner.firstName + " " + project.owner.lastName
    }
}

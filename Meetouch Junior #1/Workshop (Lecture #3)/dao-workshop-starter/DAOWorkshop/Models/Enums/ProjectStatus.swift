//
//  ProjectStatus.swift
//  DAOWorkshop
//
//  Created by Meetouch on 11/30/22.
//

import Foundation

// MARK: - ProjectStatus

public enum ProjectStatus: Int, CaseIterable {

    case inactive
    case active
    case cancelled
    case finished

    var hexColor: String {
        switch self {
        case .inactive:
            return "FFFFFF"
        case .active:
            return "005CFF"
        case .cancelled:
            return "E0261A"
        case .finished:
            return "#000000"
        }
    }

    var hexBorderColor: String {
        switch self {
        case .inactive:
            return "000000"
        default:
            return hexColor
        }
    }

    var hexContrastColor: String {
        switch self {
        case .inactive:
            return "000000"
        default:
            return "FFFFFF"
        }
    }
}

//
//  ProjectItemView.swift
//  DAOWorkshop
//
//  Created by Meetouch on 8/9/23.
//

import SwiftUI

// MARK: - ProjectItemView

struct ProjectItemView: View {
    
    let item: ProjectItemState
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .foregroundColor(.hex(item.hexBorderColorString))
                    .frame(width: Constants.statusCircleSize, height: Constants.statusCircleSize)
                Circle()
                    .foregroundColor(.hex(item.hexColorString))
                    .frame(width: Constants.statusCircleSize - 2, height: Constants.statusCircleSize - 2)
                Text(item.ownerName.prefix(1).uppercased())
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.hex(item.hexContrastColor))
            }
            .padding(.top, 2)
            VStack(alignment: .leading, spacing: 8) {
                Text(item.name)
                    .font(.system(size: 17, weight: .semibold))
                HStack {
                    Text(item.priceText)
                        .font(.system(size: 15))
                    Spacer()
                }
            }
        }
    }
}

// MARK: - Constants

extension ProjectItemView {

    enum Constants {
        static let statusCircleSize: CGFloat = 50
    }
}

// MARK: - ProjectListItemView_Previews

struct ProjectListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectItemView(
            item: ProjectItemState(from: .random())
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

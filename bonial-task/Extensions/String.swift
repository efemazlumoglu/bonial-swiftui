//
//  String.swift
//  bonial-task
//
//  Created by Efe Maz on 31.07.24.
//

import Foundation

extension String {
    func formatToRelativeTime() -> String {
        let dateFormatter = ISO8601DateFormatter()
        if let date = dateFormatter.date(from: self) {
            let relativeFormatter = RelativeDateTimeFormatter()
            relativeFormatter.unitsStyle = .short
            return relativeFormatter.localizedString(for: date, relativeTo: Date())
        }
        return "N/A"
    }
}

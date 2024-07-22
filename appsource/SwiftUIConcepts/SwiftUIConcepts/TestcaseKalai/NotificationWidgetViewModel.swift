//
//  NotificationWidgetViewModel.swift
//  IBKit
//
//  Created by Kalaiyarasan S on 17/02/23.
//  Copyright © 2019 LOREAL. All rights reserved.
//

/*
import Common
import Foundation
import ServiceManager

class NotificationWidgetViewModel {
    var widget: NotificationWidget?
    var httpStatusCode: Int?

    var tagConfig: WidgetTagViewConfig {
        var tagTitle = Localization.shared.string(forKey: .tagNotificationText)
        if let widget = widget, widget.notification == nil {
            tagTitle = Localization.shared.string(forKey: .tagFollowup)
        }
        let config = WidgetTagViewConfig(title: tagTitle, type: .important)
        return config
    }

    func fetchWidgetData(widgetUrl: String) async throws {
        let (result, statusCode) = try await SharedServiceManager.getWidgetData(widgetUrl: widgetUrl,
                                                                                type: NotificationWidget.self)
        self.httpStatusCode = statusCode
        if let widgetData = result as? NotificationWidget {
            widget = widgetData
        } else {
            throw CTError.unknown
        }
    }

    var formattedSubtitle: String? {
        if let widget,
           (widget.widgetSubType == .birthday || widget.widgetSubType == .pointsExpiry) {
            let date = DateFormatter.localizedStringFromString(widget.notification?.subTitle ?? "",
                                                               inFormat: DateTemplate.mmddyyyyHHmmssa.rawValue,
                                                               toFormat:
                                                                LocalizedDateTemplate.dMMMEEEE.rawValue,
                                                               timeZone: NSTimeZone.local)
            return date
        } else {
            return widget?.notification?.subTitle
        }
    }
}
*/

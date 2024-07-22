//
// NotificationWidgetViewModelTests.swift
// Created by Kalaiyarasan S on 06/03/23.
// Copyright © 2019 LOREAL. All rights reserved.
//    

/*
import XCTest
@testable import Common
@testable import IBKit

final class NotificationWidgetViewModelTests: IBeautyBaseTests {
    var viewModel: NotificationWidgetViewModel!

    override func setUpWithError() throws {
        viewModel = NotificationWidgetViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testWidgetConfiguration() {
        var configResult = viewModel.tagConfig
        XCTAssertEqual(configResult.title, "Notification")

        let notificationWidget = NotificationWidget(id: "25738588-ba05-4999-8793-7e909fd09abb",
                                                    type: .notification,
                                                    notification: nil)
        viewModel.widget = notificationWidget
        configResult = viewModel.tagConfig
        XCTAssertEqual(configResult.title, "Follow Up")
    }

    func testBirthdayWidgetSuccessResponse() throws {
        let widgetUrl = "/widgets/25738588-ba05-4999-8793-7e909fd09abb/notification?consumerId=01ZY7049031"
        try given("Get stubbed notification widget success API response", closure: {
            mockResolvedValue(
                by: birthdayWidgetValidResponse,
                to: .getWidgetData(widgetUrl)
            )
        })

        try when("API invoked and getting success", closure: {
            let expectation = expectation(description: "\(#file)::\(#function)::getWidgetData")
            Task {
                try? await viewModel.fetchWidgetData(widgetUrl: widgetUrl)
                XCTAssertNotNil(viewModel.widget)
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 10.0)
        })

        try then("Should able to parse the notification widget response", closure: {
            let widget = try XCTUnwrap(viewModel.widget)
            XCTAssert(widget.type == .notification)
            XCTAssertNotNil(widget.tag)
            let type = try XCTUnwrap(viewModel.widget?.tag?.type)
            XCTAssert(type == .important)
            let notification = try XCTUnwrap(widget.notification)
            XCTAssertEqual(notification.title, "")
            XCTAssertEqual(notification.subTitle, "Monday 12th Dec")
            XCTAssertNotNil(widget.emptyAction)
            XCTAssertEqual(widget.emptyActionLabel, "Add Birthday")
            XCTAssertEqual(widget.id, "25738588-ba05-4999-8793-7e909fd09abb")
            XCTAssertEqual(widget.isVisible, false)
        })
        unstubRequest()
    }

    func testBirthdayWidgetFailureResponse() throws {
        let widgetUrl = "/widgets/25738588-ba05-4999-8793-7e909fd09abb/notification?consumerId=01ZY7049031"
        try given("Get stubbed notification widget failure API response", closure: {
            mockResolvedValue(
                by: birthdayWidgetInvalidResponse,
                to: .getWidgetData(widgetUrl)
            )
        })

        try when("API invoked and getting failure", closure: {
            let expectation = expectation(description: "\(#file)::\(#function)::getWidgetData")
            Task {
                do {
                    try await viewModel.fetchWidgetData(widgetUrl: widgetUrl)
                } catch {
                    XCTAssertNotNil(error)
                }
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 10.0)
        })

        try then("Should able to parse the widget failure  response", closure: {
            XCTAssertNil(viewModel.widget)
        })
        unstubRequest()
    }

    func testPointsExpiryWidgetSuccessResponse() throws {
        let widgetUrl = "/widgets/4e83d031-f43c-45f2-ba50-016b4c859b59/notification?consumerId=01ZY7049031"
        try given("Get stubbed notification widget success API response", closure: {
            mockResolvedValue(
                by: pointsExpiryWidgetValidResponse,
                to: .getWidgetData(widgetUrl)
            )
        })

        try when("API invoked and getting success", closure: {
            let expectation = expectation(description: "\(#file)::\(#function)::getWidgetData")
            Task {
                try? await viewModel.fetchWidgetData(widgetUrl: widgetUrl)
                XCTAssertNotNil(viewModel.widget)
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 10.0)
        })

        try then("Should able to parse the notification widget response", closure: {
            let widget = try XCTUnwrap(viewModel.widget)
            XCTAssert(widget.type == .notification)
            XCTAssertNotNil(widget.tag)
            let type = try XCTUnwrap(viewModel.widget?.tag?.type)
            XCTAssert(type == .important)
            let notification = try XCTUnwrap(widget.notification)
            XCTAssertEqual(notification.title, "0 PTs Expiring")
            XCTAssertEqual(notification.subTitle, "")
            XCTAssertNil(widget.emptyAction)
            XCTAssertEqual(widget.emptyActionLabel, "None")
            XCTAssertEqual(widget.id, "4e83d031-f43c-45f2-ba50-016b4c859b59")
            XCTAssertEqual(widget.isVisible, false)
        })
        unstubRequest()
    }

    func testPointsExpiryWidgetFailureResponse() throws {
        let widgetUrl = "/widgets/4e83d031-f43c-45f2-ba50-016b4c859b59/notification?consumerId=01ZY7049031"
        try given("Get stubbed notification widget failure API response", closure: {
            mockResolvedValue(
                by: pointsExpiryWidgetInvalidResponse,
                to: .getWidgetData(widgetUrl)
            )
        })

        try when("API invoked and getting failure", closure: {
            let expectation = expectation(description: "\(#file)::\(#function)::getWidgetData")
            Task {
                do {
                    try await viewModel.fetchWidgetData(widgetUrl: widgetUrl)
                } catch {
                    XCTAssertNotNil(error)
                }
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 10.0)
        })

        try then("Should able to parse the widget failure  response", closure: {
            XCTAssertNil(viewModel.widget)
        })
        unstubRequest()
    }

    func testFormattedSubtitle() throws {
        XCTAssertNil(viewModel.formattedSubtitle)
        
        var widget = NotificationWidget()
        widget.notification = NotificationData(title: "test", subTitle: "test date")
        viewModel.widget = widget
        XCTAssertEqual(viewModel.formattedSubtitle, "test date")
        
        widget = NotificationWidget()
        widget.widgetSubType = .birthday
        widget.notification = NotificationData(title: "test", subTitle: "11/7/2023 12:00:00 AM")
        viewModel.widget = widget
        var formattedDate = DateFormatter.localizedStringFromString(widget.notification?.subTitle ?? "",
                                                                    inFormat: DateTemplate.mmddyyyyHHmmssa.rawValue,
                                                                    toFormat:
                                                                     LocalizedDateTemplate.dMMMEEEE.rawValue,
                                                                    timeZone: NSTimeZone.local)
        XCTAssertEqual(viewModel.formattedSubtitle, formattedDate)
        
        widget = NotificationWidget()
        widget.widgetSubType = .pointsExpiry
        widget.notification = NotificationData(title: "test", subTitle: "12/4/2023 12:00:00 AM")
        viewModel.widget = widget
        formattedDate = DateFormatter.localizedStringFromString(widget.notification?.subTitle ?? "",
                                                                inFormat: DateTemplate.mmddyyyyHHmmssa.rawValue,
                                                                toFormat:
                                                                    LocalizedDateTemplate.dMMMEEEE.rawValue,
                                                                timeZone: NSTimeZone.local)
        XCTAssertEqual(viewModel.formattedSubtitle, formattedDate)
    }
}


extension NotificationWidgetViewModelTests {
    var birthdayWidgetValidResponse: String { """
        {
          "tile" : {
            "bgColor" : "#D3D3D3",
            "textColor" : "#FFFFE0"
          },
          "id" : "25738588-ba05-4999-8793-7e909fd09abb",
          "notification" : {
            "title" : "Birthday in x Days",
            "subTitle" : "Monday 12th Dec"
          },
          "emptyAction" : "editProfile",
          "tag" : {
            "type" : "important"
          },
          "isVisible" : false,
          "type" : "notification",
          "emptyActionLabel" : "Add Birthday"
        }
        """
    }

    var birthdayWidgetInvalidResponse: String { """
        {
          "tile" : {
            "bgColor" : "#D3D3D3",
            "textColor" : "#FFFFE0"
          },
          "id" : "25738588-ba05-4999-8793-7e909fd09abb",
          "notification" : {
            "title" : "Birthday in x Days",
            "subTitle" : "Monday 12th Dec"
          },
          "emptyAction" : "editProfile",
          "tag" : {
            "type" : "important"
          },
          "isVisible" : "false",
          "type" : "notification",
          "emptyActionLabel" : "Add Birthday"
        }
        """
    }

    var pointsExpiryWidgetValidResponse: String { """
        {
          "tile" : {
            "bgColor" : "#D3D3D3",
            "textColor" : "#FFFFE0"
          },
          "id" : "4e83d031-f43c-45f2-ba50-016b4c859b59",
          "notification" : {
            "title" : "0 PTs Expiring",
            "subTitle" : ""
          },
          "emptyAction" : "None",
          "tag" : {
            "type" : "important"
          },
          "isVisible" : false,
          "type" : "notification",
          "emptyActionLabel" : "None"
        }
        """
    }

    var pointsExpiryWidgetInvalidResponse: String { """
        {
          "tile" : {
            "bgColor" : "#D3D3D3",
            "textColor" : "#FFFFE0"
          },
          "id" : "4e83d031-f43c-45f2-ba50-016b4c859b59",
          "notification" : {
            "title" : "0 PTs Expiring",
            "subTitle" : ""
          },
          "emptyAction" : "None",
          "tag" : {
            "type" : "important"
          },
          "isVisible" : "false",
          "type" : 8,
          "emptyActionLabel" : "None"
        }
        """
    }
}
*/

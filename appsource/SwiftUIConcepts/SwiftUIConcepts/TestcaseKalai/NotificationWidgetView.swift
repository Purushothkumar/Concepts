//
//  NotificationWidgetView.swift
//  IBKit
//
//  Created by Purushothaman M on 09/01/23.
//  Copyright © 2019 LOREAL. All rights reserved.
//


/*

import Common
import ObjectiveC
import ServiceManager
import SkeletonView
import UIKit
import Utilities

open class NotificationWidgetView: WidgetView {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var messageActionLink: UIButton!
    public var widgetTagView: WidgetTagView?
    var viewModel = NotificationWidgetViewModel()

    override open func commonInit() {
        super.commonInit()
        setupUI()
        setUIAccessibility()
        addTagView()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reloadWidget(_:)),
                                               name: .reloadWidget,
                                               object: nil)
    }

    override open func load() {
        guard let url = widget?.formattedWidgetUrl else {
            return
        }
        Task {
            do {
                showSkeleton()
                try await viewModel.fetchWidgetData(widgetUrl: url)
                handleResponse(widget: viewModel.widget)
            } catch {
                handleError(nil)
            }
            hideSkeleton()
            layer.borderWidth = 0.0
        }
    }

    private func setupUI() {
        titleLabel.skeletonTextNumberOfLines = 1
        backgroundColor = widgetBgColor
        messageActionLink.setTitleColor(widgetTextColor, for: .normal)
        titleLabel.titleLabel(fontSize: 20, txtColor: widgetTextColor)
        subtitleLabel.regularLabel(fontSize: 14, txtColor: widgetTextColor)
        messageLabel.regularLabel(fontSize: 18, txtColor: widgetTextColor)
        messageActionLink.regularClearButton(fontSize: 14)
        iconImageView.sdSetImage(with: widgetIconUrl, placeholderImage: nil)
    }

    func addTagView() {
        let tagViewFrame = CGRect(x: 10, y: 10, width: 116, height: 19)
        let tagView = WidgetTagView(frame: tagViewFrame, config: viewModel.tagConfig)
        tagView.isHidden = true
        addSubview(tagView)
        widgetTagView = tagView
    }

    @IBAction private func messageActionLinkTapped(_ sender: Any) {
        messageActionCallback?()
    }

    public func show(widget: NotificationWidget?) {
        guard let notificationData = widget?.notification else {
            return
        }

        showNormalMode()

        // Tag
        widgetTagView?.updateUI(with: viewModel.tagConfig)
        updateWidgetTagViewFrame()

        // Title
        titleLabel.text = notificationData.title

        // Subtitle
        subtitleLabel.text = viewModel.formattedSubtitle

        // Info action
        messageActionLink.titleLabel?.text = widget?.emptyActionLabel
        messageActionLink.underline()

        // Update tile UI
        updateTileUI()
    }

    public func show(widget: NotificationWidget? = nil,
                     message: String,
                     actionLink: String?,
                     actionCallback: ActionCallback?) {
        showMessageMode()

        // Tag
        widgetTagView?.updateUI(with: viewModel.tagConfig)
        updateWidgetTagViewFrame()

        // Title
        titleLabel.text = widget?.notification?.title

        // Info message
        messageLabel.text = message

        // Action link
        if let actionLink {
            messageActionLink.isHidden = false
            messageActionLink.titleLabel?.text = actionLink
            messageActionLink.underline()
        } else {
            messageActionLink.isHidden = true
        }

        // Action call back
        messageActionCallback = actionCallback

        // Update tile UI
        updateTileUI()
    }

    func updateWidgetTagViewFrame() {
        let text = viewModel.tagConfig.title?.uppercased()
        let width = (text?.widthOfString(usingFont: IBFont.appRegularTitleFontWith(size: 12)) ?? 0) + 20
        var frame = widgetTagView?.frame ?? .zero
        if width <= (self.frame.width - 10) {
            frame.size.width = width
        } else {
            frame.size.width = self.frame.width
        }
        widgetTagView?.frame = frame
    }

    private func updateTileUI() {
        setTheme(tile: viewModel.widget?.tile)
        setupUI()
    }

    private func showNormalMode() {
        // Unhide title/subttitle views
        titleLabel.isHidden = false
        subtitleLabel.isHidden = false
        widgetTagView?.isHidden = false

        // Hide info view
        messageActionCallback = nil
        messageLabel.isHidden = true
        messageActionLink.isHidden = true
    }

    private func showMessageMode() {
        // Unhide info view
        messageLabel.isHidden = false
        widgetTagView?.isHidden = false

        // Hide title/subtitle views
        titleLabel.isHidden = true
        subtitleLabel.isHidden = true
    }

    @objc
    func reloadWidget(_ notification: Notification) {
        load()
    }
}

// MARK: API Response Handler
public extension NotificationWidgetView {
    func handleResponse(widget: NotificationWidget?) {
        guard let widget else {
            show(message: localizedErrorFetchingText, actionLink: localizedRetryText) { [weak self] in
                // Retry API
                self?.load()
                self?.logWidgetAnalytics(event: .widgetTap, action: WidgetAction.tapToRetryText)
            }
            return
        }

        // Remove when the widget should be invisible
        guard widget.isVisible ?? false else {
            NotificationCenter.default.removeObserver(self, name: .reloadWidget, object: nil)
            hideWidget(true)
            widgetAction?(.removeWidget(widget.id))
            return
        }
        if WidgetErrorCodes.contains(viewModel.httpStatusCode) {
            handleError(widget)
        } else if widget.notification != nil {
            show(widget: widget)
        } else {
            let noData = Localization.shared.string(forKey: .noData)
            show(message: noData, actionLink: widget.emptyActionLabel) { [weak self] in
                guard let action = widget.emptyAction else { return }
                self?.widgetAction?(action)
                self?.logWidgetAnalytics(event: .widgetTap, action: action.value)
            }
        }
    }

    func handleError(_ widget: NotificationWidget?) {
        show(widget: widget, message: localizedErrorFetchingText, actionLink: localizedRetryText) { [weak self] in
            // Retry API
            self?.load()
            self?.logWidgetAnalytics(event: .widgetTap, action: WidgetAction.tapToRetryText)
        }
    }
}

// MARK: - CollectionViewCell
open class NotificationWidgetCell: WidgetCell {
    override public init(frame: CGRect) {
        let widgetFrame = CGRect(x: 0,
                                 y: 0,
                                 width: frame.width,
                                 height: frame.height)
        let widgetView = NotificationWidgetView(frame: widgetFrame)
        super.init(frame: frame,
                   widgetView: widgetView)
    }

    public required init?(coder: NSCoder) {
        print("init(coder:) has not been implemented")
        return nil
    }
}

// MARK: - Accessibility Identifier
extension NotificationWidgetView {
    func setUIAccessibility() {
        titleLabel.accessibilityIdentifier = AccessibilityConstants.titleLabel
        subtitleLabel.accessibilityIdentifier = AccessibilityConstants.subtitleLabel
        iconImageView.accessibilityIdentifier = AccessibilityConstants.iconImageView
        messageActionLink.accessibilityIdentifier = AccessibilityConstants.messageActionLink
        messageLabel.accessibilityIdentifier = AccessibilityConstants.messageLabel
    }
}

// MARK: - Accessibility Constants
private enum AccessibilityConstants {
    static let titleLabel = "titleLabel"
    static let subtitleLabel = "subtitleLabel"
    static let iconImageView = "iconImageview"
    static let messageActionLink = "messageActionLink"
    static let messageLabel = "messageLabel"
    static let cellSectionRow = "cell_{SECTION}_{ROW}"
    static let cellRow = "cell_{ROW}"
}



 Clean :


https://nalexn.github.io/clean-architecture-swiftui/
https://medium.com/@walfandi/a-beginners-guide-to-clean-architecture-in-ios-building-better-apps-step-by-step-53e6ec8b3abd
https://medium.com/@maykonmeneghel_55360/clean-architecture-swiftui-9bb39619af70
https://mohammadrezakhatibi.medium.com/router-pattern-with-alamofires-urlrequestconvertible-protocol-38a5cb73f0be
https://gist.github.com/mohammadrezakhatibi/eb59a7da9d4bac61f69ee2a17c4b9634#file-userrouter-swift
https://medium.com/@mehran.kmlf/clean-architecture-combine-for-swiftui-caf252c0f10c

Code flow :

https://paulallies.medium.com/clean-architecture-in-the-flavour-of-swiftui-5-5-8430786a83

https://github.com/nanosoftonline/clean-architecture-swift

https://nanosoft.co.za/blog/post/clean-architecture-in-swifui



Clean Swift Templates :

https://medium.com/swift2go/installing-the-clean-swift-template-in-xcode-6b4367006827

https://www.netguru.com/blog/clean-swift-ios-architecture-pattern

https://medium.com/@veeranjain04/top-10-swiftui-features-every-app-developer-should-know-c784b4cadc7c


Clean + SwiftUI :

https://medium.com/@maykonmeneghel_55360/clean-architecture-swiftui-9bb39619af70

https://medium.com/@walfandi/a-beginners-guide-to-clean-architecture-in-ios-building-better-apps-step-by-step-53e6ec8b3abd

 */

import Foundation
import Publish
import Plot

struct FooterLink: Hashable {
    var title: String
    let destinationURL: URL?
    let destinationPath: Path?
    let iconPath: Path
    let iconAltText: String
    let openInNewTab: Bool

    init(
        title: String,
        destinationURL: URL?,
        iconPath: Path,
        iconAltText: String,
        openInNewTab: Bool = true
    ) {
        self.title = title
        self.destinationURL = destinationURL
        self.destinationPath = nil
        self.iconPath = iconPath
        self.iconAltText = iconAltText
        self.openInNewTab = openInNewTab
    }

    init(
        title: String,
        destinationPath: Path?,
        iconPath: Path,
        iconAltText: String,
        openInNewTab: Bool
    ) {
        self.title = title
        self.destinationURL = nil
        self.destinationPath = destinationPath
        self.iconPath = iconPath
        self.iconAltText = iconAltText
        self.openInNewTab = openInNewTab
    }
}

struct FooterText: Hashable {
    var title: String
    let description: String
}

enum FooterItemType: Hashable {
    case link(link: FooterLink)
    case text(text: FooterText)
}

extension Node where Context == HTML.BodyContext {
    static func footerItem(_ item: FooterItemType) -> Self {
        switch item {
        case let .link(linkItem):
            return .a(
                .class("body-link"),
                .if(linkItem.openInNewTab, .target(.blank)),
                .unwrap(
                    linkItem.destinationURL,
                    { .href($0) },
                    else: .unwrap(linkItem.destinationPath, { .href($0) })
                ),
                .span(
                    .class("footer-item  one-liner"),
                    .p(
                        .class("body-text  footer-item-text  footer-item-text__link"),
                        .text(linkItem.title)
                    ),
                    .img(
                        .class("footer-item-icon"),
                        .src(linkItem.iconPath),
                        .alt(linkItem.iconAltText)
                    )
                )
            )
        case let .text(textItem):
            return .span(
                .class("footer-item  one-liner"),
                .p(
                    .class("body-text  footer-item-text  footer-item-text__plain"),
                    .text(textItem.title)
                ),
                .p(
                    .class("body-text  footer-item-text__description"),
                    .text(textItem.description)
                )
            )
        }
    }
}


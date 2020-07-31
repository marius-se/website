import Foundation
import Publish
import Plot

enum FooterItem: Hashable {
    case link(title: String, destination: URL, openInNewTab: Bool = true, iconPath: Path, iconAltText: String)
    case text(title: String, description: String)
}

extension Node where Context == HTML.BodyContext {
    static func footerItem(_ item: FooterItem) -> Self {
        switch item {
        case let .link(title, destination, newTab, iconPath, iconAltText):
            return .a(
                .class("body-link"),
                .if(newTab, .target(.blank)),
                .href(destination),
                .span(
                    .class("footer-item  one-liner"),
                    .p(.class("body-text  footer-item-text  footer-item-text__link"), .text(title)),
                    .img(
                        .class("footer-item-icon"),
                        .src(iconPath),
                        .alt(iconAltText)
                    )
                )
            )
        case let .text(title, description):
            return .span(
                .class("footer-item  one-liner"),
                .p(.class("body-text  footer-item-text  footer-item-text__plain"), .text(title)),
                .p(.class("body-text  footer-item-text__description"), .text(description))
            )
        }
    }
}


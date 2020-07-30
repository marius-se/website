import Foundation
import Publish
import Plot

struct MariusSeufzerWebsite: Website {
    enum SectionID: String, WebsiteSectionID {
        case projects
    }

    struct ItemMetadata: WebsiteItemMetadata {
        let previewImagePath: Path
        let previewImageAltText: String
    }

    var url = URL(string: "https://your-website-url.com")!
    var name = "mariusseufzer-website"
    var description = "A description of mariusseufzer-website"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

try MariusSeufzerWebsite().publish(withTheme: .appStore)

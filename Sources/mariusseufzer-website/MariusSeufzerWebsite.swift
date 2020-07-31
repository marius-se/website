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

    let url = URL(string: "https://your-website-url.com")!
    let name = "mariusseufzer-website"
    let description = "A description of mariusseufzer-website"
    var language: Language { .english }
    var imagePath: Path? { nil }

    let footerItems: Array<FooterItem> = [
        FooterItem.link(
            title: "LinkedIn",
            destination: URL(string: "https://linkedin.com/in/marius-seufzer")!,
            iconPath: Path("AppStoreTheme/assets/iconLinkedIn.png"),
            iconAltText: "LinkedIn logo"
        ),
        FooterItem.link(
            title: "GitHub",
            destination: URL(string: "https://github.com/mariusseufzer")!,
            iconPath: Path("AppStoreTheme/assets/iconGitHub.svg"),
            iconAltText: "GitHub logo"
        ),
        FooterItem.link(
            title: "Instagram",
            destination: URL(string: "https://instagram.com/mariusseufzer")!,
            iconPath: Path("AppStoreTheme/assets/iconInstagram.png"),
            iconAltText: "Instagram logo"
        ),
        FooterItem.link(
            title: "Privacy Policy",
            destination: URL(string: "#")!,
            iconPath: Path("AppStoreTheme/assets/iconPrivacy.png"),
            iconAltText: "Privacy icon"
        ),
        FooterItem.text(
            title: "Copyright",
            description: "&copy; 2019 Marius Seufzer"
        )
    ]
}

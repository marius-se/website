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
        /// Key/Value pair for alt text and path to the image resource
        let images: [Path]
        let isIPad: Bool
    }

    let url = URL(string: "https://www.mariusseufzer.com")!
    let name = "Marius Seufzer - Swift iOS Developer"
    let description = "My portfolio website"
    var language: Language { .english }
    var imagePath: Path? { nil }

    let footerItems: Array<FooterItemType> = [
        .link(link:
            .init(
                title: "LinkedIn",
                destinationURL: URL(string: "https://linkedin.com/in/marius-seufzer")!,
                iconPath: Path("AppStoreTheme/assets/iconLinkedIn.png"),
                iconAltText: "LinkedIn logo"
            )
        ),
        .link(link:
            .init(
                title: "GitHub",
                destinationURL: URL(string: "https://github.com/marius-se")!,
                iconPath: Path("AppStoreTheme/assets/iconGitHub.svg"),
                iconAltText: "GitHub logo"
            )
        ),
        .link(link:
            .init(
                title: "Instagram",
                destinationURL: URL(string: "https://instagram.com/mariusseufzer")!,
                iconPath: Path("AppStoreTheme/assets/iconInstagram.png"),
                iconAltText: "Instagram logo"
            )
        ),
        .link(link:
            .init(
                title: "Privacy Policy",
                destinationPath: Path("privacy-policy"),
                iconPath: Path("AppStoreTheme/assets/iconPrivacy.png"),
                iconAltText: "Privacy icon",
                openInNewTab: false
            )
        ),
        .text(text:
            .init(
                title: "Copyright",
                description: "&copy; 2020 Marius Seufzer"
            )
        )
    ]

    
}

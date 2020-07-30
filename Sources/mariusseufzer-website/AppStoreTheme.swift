import Foundation
import Publish
import Plot

extension Theme where Site == MariusSeufzerWebsite {
    static var appStore: Self {
        Theme(
            htmlFactory: AppStoreHTMLFactory(),
            resourcePaths: ["Resources/AppStoreTheme/styles.css"]
        )
    }

    fileprivate struct AppStoreHTMLFactory: HTMLFactory {
        func makeIndexHTML(for index: Index, context: PublishingContext<MariusSeufzerWebsite>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: index, on: context.site),
                .body(
                    .header(
                        .class("header"),
                        .img(
                            .class("profile-picture"),
                            .src(Path("AppStoreTheme/assets/profilePicture.jpg")),
                            .alt("Profile picture of Marius Seufzer")
                        ),
                        .div(
                            .class("header-text-wrapper"),
                            .h1(.class("main-title"), .text("Marius Seufzer - Freelancer")),
                            .h2(.class("main-sub-title"), .text("Swift& iOS Developer")),
                            .a(
                                .class("call-to-action"),
                                .href("mailto:Marius%20Seufzer%20%3Cmarius.seufzer@icloud.com%3E"),
                                .text("CONTACT")
                            )
                        )
                    ),
                    .hr()
                )
            )
        }

        func makeSectionHTML(for section: Section<MariusSeufzerWebsite>,
                             context: PublishingContext<MariusSeufzerWebsite>) throws -> HTML {
            HTML(.empty)
        }

        func makeItemHTML(for item: Item<MariusSeufzerWebsite>,
                          context: PublishingContext<MariusSeufzerWebsite>) throws -> HTML {
            HTML(.empty)
        }

        func makePageHTML(for page: Page,
                          context: PublishingContext<MariusSeufzerWebsite>) throws -> HTML {
            HTML(.empty)
        }

        func makeTagListHTML(for page: TagListPage,
                             context: PublishingContext<MariusSeufzerWebsite>) throws -> HTML? {
            HTML(.empty)
        }

        func makeTagDetailsHTML(for page: TagDetailsPage,
                                context: PublishingContext<MariusSeufzerWebsite>) throws -> HTML? {
            HTML(.empty)
        }
    }
}

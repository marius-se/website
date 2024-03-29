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
                        .class("header  defaultContainer"),
                        .img(
                            .class("profile-picture"),
                            .src(Path("AppStoreTheme/assets/profilePicture.jpg")),
                            .alt("Profile picture of Marius Seufzer")
                        ),
                        .div(
                            .class("header-text-wrapper"),
                            .h1(.class("title  header-title"), .text("Marius Seufzer - Freelancer")),
                            .h2(.class("subtitle  header-subtitle"), .text("Swift& iOS Developer")),
                            .a(
                                .class("call-to-action"),
                                .href("mailto:Marius%20Seufzer%20%3Cmarius.seufzer@icloud.com%3E"),
                                .text("CONTACT")
                            )
                        )
                    ),
                    .div(
                        .class("defaultContainer"),
                        .hr()
                    ),
                    .main(
                        .div(
                            .class("projects"),
                            .h3(.class("title  defaultContainer"), .text("Projects")),
                            .div(
                                .class("horizontal-scroll"),
                                .forEach(context.sections[.projects].items.sorted(
                                            by: { $0.metadata.id > $1.metadata.id }
                                ), {
                                    .a(
                                        .img(
                                            .class("project-card"),
                                            .src($0.metadata.previewImagePath),
                                            .alt($0.metadata.previewImageAltText)
                                        ),
                                        .href($0.path)
                                    )
                                })
                            ),
                            .div(
                                .class("one-liner  defaultContainer"),
                                .img(
                                    .class("other-skills-icon"),
                                    .src(Path("AppStoreTheme/assets/iconPallet.png")),
                                    .alt("Other platforms icon")
                                ),
                                .h4(
                                    .class("subtitle  other-skills-text"),
                                    .text("Also developing for other platforms including server-side Swift")
                                )
                            )
                        ),
                        .div(
                            .class("defaultContainer"),
                            .hr()
                        ),
                        .div(
                            .class("about-me  defaultContainer"),
                            .p(
                                .class("body-text"),
                                .text("""
                                    Hey, my name is Marius. I am a Swift developer. I prototype, design, program and maintain mainly for iOS but also macOS and other Apple devices, as well as backend systems. Back in 2013, I started to teach myself how to code. These days I'm studying software engineering at the CODE University of Applied Sciences in Berlin, have developed multiple apps and started running my own business: Freelancing.
                                """),
                                .br(),
                                .br(),
                                .text("If you have any questions about my service, or just wanna say hello, feel free to contact me. You can e-mail me at "
                                ),
                                .a(
                                    .class("body-link"),
                                    .href("mailto:Marius%20Seufzer%20%3Cmarius.seufzer@icloud.com%3E"),
                                    .text("marius.seufzer@icloud.com")
                                ),
                                .text(" or directly message me on Instagram "),
                                .a(
                                    .class("body-link"),
                                    .href(URL(string: "https://instagram.com/mariusseufzer")!),
                                    .text("@mariusseufzer")
                                ),
                                .text("."),
                                .br(),
                                .br(),
                                .text("""
                                    KungFu/Thaibox junkie. 15% artist.
                                """)
                            )
                        )
                    ),
                    .div(
                        .class("defaultContainer"),
                        .hr()
                    ),
                    .footer(
                        .class("footer  defaultContainer"),
                        .h3(.class("title"), .text("Footer")),
                        .ul(
                            .class("footer-list"),
                            .forEach(context.site.footerItems, {
                                .li(
                                    .footerItem($0),
                                    .if(context.site.footerItems.last != $0, .hr())
                                )
                            })
                        )
                    )
                )
            )
        }

        func makeSectionHTML(for section: Section<MariusSeufzerWebsite>,
                             context: PublishingContext<MariusSeufzerWebsite>) throws -> HTML {
            HTML(.empty)
        }

        func makeItemHTML(for item: Item<MariusSeufzerWebsite>,
                          context: PublishingContext<MariusSeufzerWebsite>) throws -> HTML {
            let projectCardClasses = "project-card" +
                (item.metadata.isIPad ? "  project-card__iPad" : "")
            return HTML(
                .lang(context.site.language),
                .head(for: item, on: context.site),
                .body(
                    .header(
                        .class("navigation-bar"),
                        .a(
                            .class("pin-right  body-link  body-link__bold"),
                            .href(Path("index.html")),
                            .text("Done")
                        )
                    ),
                    .main(
                        .class("defaultContainer  body-text"),
                        .h2(
                            .class("title  header"),
                            .text(item.title)
                        ),
                        item.body.node,
                        .div(
                            .class("horizontal-scroll  horizontal-scroll__no-inset"),
                            .forEach(item.metadata.images, {
                                .img(
                                    .class(projectCardClasses),
                                    .src($0),
                                    .alt("Project screenshot")
                                )
                            })
                        )
                    )
                )
            )
        }

        func makePageHTML(for page: Page,
                          context: PublishingContext<MariusSeufzerWebsite>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: page, on: context.site),
                .body(
                    .header(
                        .class("navigation-bar"),
                        .a(
                            .class("body-link"),
                            .href(Path("index.html")),
                            .text("< Back")
                        )
                    ),
                    .main(
                        .class("defaultContainer  body-text"),
                        .h2(
                            .class("title  header"),
                            .text(page.title)
                        ),
                        page.body.node
                    )
                )
            )
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

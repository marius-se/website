try MariusSeufzerWebsite().publish(using: [
    .addMarkdownFiles(),
    .copyResources(),
    .generateHTML(withTheme: .appStore),
    .generateSiteMap()
])

try MariusSeufzerWebsite().publish(using: [
    .addMarkdownFiles(),
    .copyResources(),
    .generateHTML(withTheme: .appStore),
    .generateSiteMap(),
    .deploy(using: .gitHub("marius-se/website", useSSH: true))
])

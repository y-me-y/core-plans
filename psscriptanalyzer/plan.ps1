$pkg_name="psscriptanalyzer"
$pkg_origin="core"
$pkg_version="1.19.1"
$pkg_license=@('MIT')
$pkg_upstream_url="https://github.com/PowerShell/PSScriptAnalyzer"
$pkg_description="PSScriptAnalyzer is the ubiquitous linter for PowerShell"
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_source="https://github.com/PowerShell/PSScriptAnalyzer/releases/download/$pkg_version/PSScriptAnalyzer.zip"
$pkg_shasum="151a4e6df2bc5a66192ee5db4af4132e17159860861191646cffd38d06ce71a2"

function Invoke-Install {
    mkdir "$pkg_prefix/module"
    Copy-Item * "$pkg_prefix/module" -Recurse -Force
}

pkg_name=cerebro
pkg_origin=core
pkg_version=0.9.3
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_description="Cerebro: Elasticsearch Administration"
pkg_upstream_url="https://github.com/lmenezes/cerebro"
pkg_license=("Apache-2.0")
pkg_filename="${pkg_name}-${pkg_version}.tgz"
pkg_source="https://github.com/lmenezes/cerebro/releases/download/v${pkg_version}/${pkg_filename}"
pkg_shasum=8fb294ffae01faf3ea8f980760db199b8dcb2bd44c406f63ae3078301ff62753
pkg_deps=(
	core/coreutils
	core/openjdk11
)
pkg_bin_dirs=(bin)
pkg_exports=(
  [port]=port
)
pkg_exposes=(port)

do_build() {
	return 0
}

do_install() {
	cp -r ./* "${pkg_prefix}/"
	mkdir -p "${pkg_prefix}/logs"
	fix_interpreter "${pkg_prefix}/bin/*" core/coreutils bin/env
}

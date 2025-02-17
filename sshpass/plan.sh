pkg_name=sshpass
pkg_origin=core
pkg_version="1.09"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("GPL-2.0-or-later")
pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
pkg_source="https://downloads.sourceforge.net/project/${pkg_name}/${pkg_name}/${pkg_version}/${pkg_filename}"
pkg_shasum=71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8dc48717dedc49fb7
pkg_build_deps=(core/make core/gcc)
pkg_bin_dirs=(bin)
pkg_description="Non-interactive ssh password auth"
pkg_upstream_url="https://sourceforge.net/projects/sshpass/"

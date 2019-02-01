pkg_name=hspec-discover
pkg_origin=core
pkg_version=2.7.0
pkg_license=('MIT')
pkg_upstream_url="https://hspec.github.io/"
pkg_description="Automatically discover and run Hspec tests"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source="https://hackage.haskell.org/package/${pkg_name}-${pkg_version}/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="1cb6d6cd494a191b74aa54465005929c73911bf8cd79bb8f7773f4611bf06bd8"

pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)

pkg_deps=(
  core/glibc
  core/gmp
  core/libffi
)

pkg_build_deps=(
  core/cabal-install
  core/ghc
)

do_clean() {
  do_default_clean

  # Strip any previous cabal config/cache
  rm -rf /root/.cabal
}

do_build() {
  cabal sandbox init
  cabal update

  # Install dependencies
  cabal install --only-dependencies

  # Configure and Build
  cabal configure --prefix="$pkg_prefix" \
    --disable-executable-dynamic \
    --disable-shared
  cabal build
}

do_install() {
  cabal copy
}

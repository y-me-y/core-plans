pkg_origin=core
pkg_name=tomcat-native
pkg_description="The Apache Tomcat Native Library is an optional component for use with Apache Tomcat that allows Tomcat to use certain native resources for performance, compatibility, etc."
pkg_version='1.2.26'
pkg_maintainer='The Habitat Maintainers <humans@habitat.sh>'
pkg_license=('Apache 2.0')
pkg_source="http://archive.apache.org/dist/tomcat/tomcat-connectors/native/$pkg_version/source/$pkg_name-$pkg_version-src.tar.gz"
pkg_shasum=b7e5449d206803d6581e0bda7694c9ca8b989938e0054c468df87f9ecb28757d
pkg_deps=(core/apr core/gcc-libs)
pkg_build_deps=(core/gcc core/make core/openssl core/openjdk11)
pkg_lib_dirs=(lib)

pkg_upstream_url=http://tomcat.apache.org/native-doc/

do_build() {
  pushd "$HAB_CACHE_SRC_PATH/$pkg_name-$pkg_version-src/native"
  ./configure --with-apr="$(pkg_path_for core/apr)" \
              --with-java-home="$(pkg_path_for core/openjdk11)" \
              --with-ssl="$(pkg_path_for core/openssl)" \
              --prefix="${pkg_prefix}"
  make
  popd
}

do_install() {
  pushd "$HAB_CACHE_SRC_PATH/$pkg_name-$pkg_version-src/native"
  make install
  popd
}

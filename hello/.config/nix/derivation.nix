{ stdenv, fetchurl }:
stdenv.mkDerivation rec {
  version = "2.10";
  name = "foobar-${version}";
  tarball = "hello-${version}";
  src = fetchurl {
    url = "mirror://gnu/hello/${name}.tar.gz";
    sha256 = "0ssi1wpaf7plaswqqjwigppsg5fyh99vdlb9kzl7c9lng89ndq1i";
  };
  doCheck = true;
}
/*
{stdenv, pkgconfig, cmake, cppunit, boost, ... }:
stdenv.mkDerivation rec {
  name = "my-project-${version}";
  version = "0.0.1";

  src = ./. ;
  nativeBuildInputs = [ cmake pkgconfig ];
  buildInputs = [ boost ];

  enableParallelBuilding = true;
  releaseName = name;

  meta = with stdenv.lib; {
    description = "Some Project in C++";
    homepage = https://example.org/my-project;
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    maintainers = [ "me@example.org" ];
  };
}
*/

/*
{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hello-${version}";
  version = "2.10";

  src = fetchurl {
    url = "mirror://gnu/hello/${name}.tar.gz";
    sha256 = "0ssi1wpaf7plaswqqjwigppsg5fyh99vdlb9kzl7c9lng89ndq1i";
  };

  doCheck = true;

  meta = with stdenv.lib; {
    description = "A program that produces a familiar, friendly greeting";
    longDescription = ''
      GNU Hello is a program that prints "Hello, world!" when you run it.
      It is fully customizable.
    '';
    homepage = https://www.gnu.org/software/hello/manual/;
    license = licenses.gpl3Plus;
    maintainers = [ maintainers.eelco ];
    platforms = platforms.all;
  };
}
*/

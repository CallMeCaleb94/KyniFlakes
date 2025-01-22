{ stdenv, fetchFromGitHub, cmake, libusb1, libglvnd, mesa, pkg-config, udev }:

stdenv.mkDerivation rec {
  pname = "freenect2";
  version = "0.2.0";  # Check for the latest version

  src = fetchFromGitHub {
    owner = "OpenKinect";
    repo = "libfreenect2";
    rev = "v${version}";
    sha256 = "0h03s2313269m1823916m6916m916m91";  # You need to calculate this SHA256
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    libusb1
    libglvnd
    mesa
    udev
  ];

  # If you need to modify build steps, you can specify them here
  preConfigure = ''
    cmakeFlagsArray+=("-DCMAKE_BUILD_TYPE=Release")
  '';

  meta = with stdenv.lib; {
    description = "Drivers and libraries for the Kinect v2";
    homepage = "https://github.com/OpenKinect/libfreenect2";
    license = licenses.gpl2;
    platforms = platforms.linux;
  };
}

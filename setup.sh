#!/usr/bin/env bash
# A "living" environment setup script. It installs development tools using
# apt, pip, npm or manual downloads. Failures are logged but the script
# continues so that later steps can still run.
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

# Debug output and logging
LOGFILE="$(dirname "$0")/setup.log"
exec > >(tee -a "$LOGFILE") 2>&1
set -x

apt_pin_install(){
  pkg="$1"
  ver=$(apt-cache show "$pkg" 2>/dev/null | awk '/^Version:/{print $2; exit}') || true
  if [ -n "$ver" ]; then
    apt-get install -y "${pkg}=${ver}" && return
  fi
  if apt-get install -y "$pkg"; then
    return
  fi
  echo "APT install failed for $pkg" >&2
  if pip3 install --no-cache-dir "$pkg"; then
    return
  fi
  if npm install -g "$pkg" >/dev/null 2>&1; then
    return
  fi
  case "$pkg" in
    capnproto)
      curl -fsSL -o /tmp/capnproto.tar.gz \
        https://github.com/capnproto/capnproto/releases/download/v0.10.2/capnproto-c++-0.10.2.tar.gz && \
        tar -xzf /tmp/capnproto.tar.gz -C /tmp && \
        (cd /tmp/capnproto-c++-* && ./configure && make -j$(nproc) && make install) && \
        rm -rf /tmp/capnproto* && return
      ;;
  esac
  echo "Failed to install $pkg via all methods" >&2
}

for arch in i386 armel armhf arm64 riscv64 powerpc ppc64el ia64; do
  dpkg --add-architecture "$arch"
done

apt-get update -y || true
apt-get dist-upgrade -y || true

# Ensure meson is installed via apt
meson_install() {
  if ! command -v meson >/dev/null 2>&1; then
    apt_pin_install meson
  fi
}

# Use clang and modern C23 standard by default
export CC=clang
export CXX=clang++
export CFLAGS="-std=c23"
export CXXFLAGS="-std=c++23"

for pkg in \
  build-essential gcc g++ clang lld llvm llvm-dev libclang-dev \
  clangd clang-tidy clang-format clang-tools shellcheck capnproto \
  uncrustify astyle editorconfig pre-commit \
  make bmake ninja-build cmake meson \
  autoconf automake libtool m4 gawk flex bison byacc \
  pkg-config file ca-certificates curl git unzip \
  libopenblas-dev liblapack-dev libeigen3-dev \
  strace ltrace linux-perf systemtap systemtap-sdt-dev crash \
  valgrind kcachegrind trace-cmd kernelshark \
  libasan6 libubsan1 likwid hwloc \
  xorg-dev graphviz doxygen; do
  apt_pin_install "$pkg"
done

for pkg in \
  python3 python3-pip python3-dev python3-venv python3-wheel \
  python3-numpy python3-scipy python3-pandas \
  python3-matplotlib python3-scikit-learn \
  python3-torch python3-torchvision python3-torchaudio \
  python3-onnx python3-onnxruntime; do
  apt_pin_install "$pkg"
done

pip3 install --no-cache-dir \
  tensorflow-cpu jax jaxlib \
  tensorflow-model-optimization mlflow onnxruntime-tools

for pkg in \
  qemu-user-static \
  qemu-system-x86 qemu-system-arm qemu-system-aarch64 \
  qemu-system-riscv64 qemu-system-ppc qemu-system-ppc64 qemu-utils; do
  apt_pin_install "$pkg"
done

for pkg in \
  bcc bin86 elks-libc \
  gcc-ia64-linux-gnu g++-ia64-linux-gnu \
  gcc-i686-linux-gnu g++-i686-linux-gnu \
  gcc-aarch64-linux-gnu g++-aarch64-linux-gnu \
  gcc-arm-linux-gnueabi g++-arm-linux-gnueabi \
  gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf \
  gcc-riscv64-linux-gnu g++-riscv64-linux-gnu \
  gcc-powerpc-linux-gnu g++-powerpc-linux-gnu \
  gcc-powerpc64-linux-gnu g++-powerpc64-linux-gnu \
  gcc-powerpc64le-linux-gnu g++-powerpc64le-linux-gnu \
  gcc-m68k-linux-gnu g++-m68k-linux-gnu \
  gcc-hppa-linux-gnu g++-hppa-linux-gnu \
  gcc-loongarch64-linux-gnu g++-loongarch64-linux-gnu \
  gcc-mips-linux-gnu g++-mips-linux-gnu \
  gcc-mipsel-linux-gnu g++-mipsel-linux-gnu \
  gcc-mips64-linux-gnuabi64 g++-mips64-linux-gnuabi64 \
  gcc-mips64el-linux-gnuabi64 g++-mips64el-linux-gnuabi64; do
  apt_pin_install "$pkg"
done

for pkg in \
  golang-go nodejs npm typescript \
  rustc cargo clippy rustfmt \
  lua5.4 liblua5.4-dev luarocks \
  ghc cabal-install hlint stylish-haskell \
  sbcl ecl clisp cl-quicklisp slime cl-asdf \
  ldc gdc dmd-compiler dub libphobos-dev \
  chicken-bin libchicken-dev chicken-doc \
  openjdk-17-jdk maven gradle dotnet-sdk-8 mono-complete \
  swift swift-lldb swiftpm kotlin gradle-plugin-kotlin \
  ruby ruby-dev gem bundler php-cli php-dev composer phpunit \
  r-base r-base-dev dart flutter gnat gprbuild gfortran gnucobol \
  fpc lazarus zig nim nimble crystal shards gforth; do
  apt_pin_install "$pkg"
done

for pkg in \
  libqt5-dev qtcreator libqt6-dev \
  libgtk1.2-dev libgtk2.0-dev libgtk-3-dev libgtk-4-dev \
  libfltk1.3-dev xorg-dev libx11-dev libxext-dev \
  libmotif-dev openmotif cde \
  xfce4-dev-tools libxfce4ui-2-dev lxde-core lxqt-dev-tools \
  libefl-dev libeina-dev \
  libwxgtk3.0-dev libwxgtk3.0-gtk3-dev \
  libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev \
  libglfw3-dev libglew-dev; do
  apt_pin_install "$pkg"
done

for pkg in \
  docker.io podman buildah virt-manager libvirt-daemon-system qemu-kvm \
  gdb lldb perf gcovr lcov bcc-tools bpftrace afl++ american-fuzzy-lop bear \
  openmpi-bin libopenmpi-dev mpich; do
  apt_pin_install "$pkg"
done

# Formal verification and optimization tooling
for pkg in \
  coq coqide isabelle tla-tools \
  llvm-bolt libpolly-17-dev; do
  apt_pin_install "$pkg"
done

IA16_VER=$(curl -fsSL https://api.github.com/repos/tkchia/gcc-ia16/releases/latest | awk -F\" '/tag_name/{print $4; exit}')
curl -fsSL "https://github.com/tkchia/gcc-ia16/releases/download/${IA16_VER}/ia16-elf-gcc-linux64.tar.xz" | tar -Jx -C /opt
echo 'export PATH=/opt/ia16-elf-gcc/bin:$PATH' > /etc/profile.d/ia16.sh
export PATH=/opt/ia16-elf-gcc/bin:$PATH

PROTO_VERSION=25.1
curl -fsSL "https://raw.githubusercontent.com/protocolbuffers/protobuf/v${PROTO_VERSION}/protoc-${PROTO_VERSION}-linux-x86_64.zip" -o /tmp/protoc.zip
unzip -d /usr/local /tmp/protoc.zip
rm /tmp/protoc.zip

command -v gmake >/dev/null 2>&1 || ln -s "$(command -v make)" /usr/local/bin/gmake

# Install meson now that dependencies are available
meson_install

# Run a minimal build to ensure toolchain works
if command -v meson >/dev/null 2>&1; then
  meson setup build
  ninja -C build
  rm -rf build
fi

apt-get clean
rm -rf /var/lib/apt/lists/*

exit 0

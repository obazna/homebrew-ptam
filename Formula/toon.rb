class Toon < Formula
  desc "TooN - Tom's Object Oriented Numerics library"
  homepage "https://www.edwardrosten.com/cvd/toon.html"
  url "https://github.com/edrosten/TooN/archive/refs/tags/TOON_3.2.tar.gz"
  sha256 "62f30dfb92a6f8873e6a42649760e2d1b54e61e1d3bc023d0bb171600b41c759"
  license "BSD-2-Clause"
  head "https://github.com/edrosten/TooN.git"

  depends_on "pkg-config" => :build

  def install
       #inreplace "TooN.pc.in", "@prefix@", HOMEBREW_PREFIX
       # Avoid superenv shim
       ENV["PKG_CONFIG"] = Formula["pkg-config"].bin/"pkg-config"

       system "./configure", "--disable-debug",
                             "--disable-dependency-tracking",
                             "--prefix=#{prefix}"
       system "make", "install"
  end
end
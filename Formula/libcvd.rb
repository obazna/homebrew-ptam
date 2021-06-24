class Libcvd < Formula
  desc "libcvd - efficient and easy to use C++ computer vision library."
  homepage "http://www.edwardrosten.com/cvd/"
  url "https://github.com/edrosten/libcvd/archive/refs/tags/RELEASE_2_3_1.tar.gz"
  sha256 "bda043f8baad379f77931f5cce9e59a51c5a1feca153b06289d3ce0fc2d09952"
  license "BSD-2-Clause"
  head "https://github.com/edrosten/libcvd.git"

  depends_on "pkg-config" => :build
  depends_on "cmake" => :build

  depends_on 'libx11' => :recommended
  depends_on 'mesa' => :recommended
  depends_on 'libpng' => :recommended
  depends_on 'jpeg' => :recommended
  depends_on 'libtiff' => :recommended
  depends_on 'toon' => :recommended
  depends_on 'ffmpeg' => :recommended

  def install
       #-DBUILD_SHARED_LIBS=ON
       args = std_cmake_args + %W[
            -DCVD_ENABLE_TESTS=OFF
            -DCVD_ENABLE_PROGS=OFF
            -DCVD_ENABLE_EXAMPLES=OFF
            -DOPENGL_INCLUDE_DIR=#{Formula["mesa"].include}
            -DOPENGL_gl_LIBRARY=#{Formula["mesa"].lib}/#{shared_library("libGL")}
       ]
       mkdir "build" do
            #on_macos do
               #inreplace '../cmake/CVDFindAllDeps.cmake' do |s|
               #  s.gsub! "find_package(X11)", ""
               #end
               #inreplace '../cmake/CVDFindFFMPEG.cmake' do |s|
               #  s.gsub! "find_package(X11)", ""
               #end
            #end
            system "cmake", "..", *args
            system "make", "install"
       end
  end
end
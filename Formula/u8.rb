# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class U8 < Formula
  url "https://files.universablockchain.com/s/ytSbcqbAX3x6R8y/download"
  sha256 "197ad13f0fd3a1705e1aeffbd82b1fbce3dbfeaec26ebe81eb628598e56bfcd1"
  version "0.3"
  desc "JavaScript + C++ Universa Node/codebase runtime environment implementation using V8 JavaScript engine."
  homepage "https://kb.universablockchain.com/u8/150"

  depends_on "libzip" => :build
  depends_on "v8" => :build
  depends_on "cmake" => :build
  depends_on :xcode => "10.2.1"

  def install
    system "cmake", ".", "-DBREW_FORMULAE=true", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_BUILD_TYPE=Release", "-DU8_BUILD_MONOLITH=true"
    system "cmake", "--build", ".", "--target", "u8", "--", "-j"
    system "cmake", "-P", "cmake_install.cmake"
  end

  test do
    assert_match "42", shell_output("#{bin}/u8 --e '42'")
  end
end

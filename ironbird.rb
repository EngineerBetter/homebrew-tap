class Ironbird < Formula
  desc "Test Concourse tasks using a YAML DSL for Ginkgo/Gomega"
  homepage "https://www.engineerbetter.com"
  license "Apache-2.0"
  version "0.0.14"

  if OS.mac?
    url "https://github.com/EngineerBetter/ironbird/releases/download/#{version}/ironbird-darwin"
    sha256 "a59a915b00db6300c00d765997edd65989d878b71d64cde026d9fd54c9fdade2"
  elsif OS.linux?
    url "https://github.com/EngineerBetter/ironbird/releases/download/#{version}/ironbird-linux"
    sha256 "46ccd578d1aeca66421a519c2d237af00a00665f4fc10a41abd2c05507d9d17e"
  end

  depends_on :arch => :x86_64

  def install
    binary_name = "ironbird"
    if OS.mac?
      bin.install "ironbird-darwin" => binary_name
    elsif OS.linux?
      bin.install "ironbird-linux" => binary_name
    end
  end

  test do
    system "#{bin}/ironbird --help"
  end
end

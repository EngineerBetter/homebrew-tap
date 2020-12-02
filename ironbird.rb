class Ironbird < Formula
  desc "Test Concourse tasks using a YAML DSL for Ginkgo/Gomega"
  homepage "https://www.engineerbetter.com"
  license "Apache-2.0"
  version "0.0.13"

  if OS.mac?
    url "https://github.com/EngineerBetter/ironbird/releases/download/#{version}/ironbird-darwin"
    sha256 "067ba41891b27d9f05e1da0cfd97a03b8fa9b7a9bd3eed157f5e92e3baebeecb"
  elsif OS.linux?
    url "https://github.com/EngineerBetter/ironbird/releases/download/#{version}/ironbird-linux"
    sha256 "db7c8acb51667a7ced57b0dc8f651e64289992076f0e5157cbb8fbd7ebe5c39a"
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

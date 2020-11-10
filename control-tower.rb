class ControlTower < Formula
  desc "Deploy and operate Concourse CI in a single command"
  homepage "https://www.engineerbetter.com"
  license "Apache-2.0"
  version "0.13.9"

  if OS.mac?
    url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-darwin-amd64"
    sha256 "a504d0d79436f741f1e8c9d27ce0b2daa25e3383659021a16777abe9689f410e"
  elsif OS.linux?
    url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-linux-amd64"
    sha256 "6fce6933b4907835fc5d3cc10926e9eac2c2b4ed99e265ee3a4c51a85a31bcf3"
  end

  depends_on :arch => :x86_64

  def install
    binary_name = "control-tower"
    if OS.mac?
      bin.install "control-tower-darwin-amd64" => binary_name
    elsif OS.linux?
      bin.install "control-tower-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/control-tower --help"
  end
end

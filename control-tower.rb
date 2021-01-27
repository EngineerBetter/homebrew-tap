class ControlTower < Formula
  desc "Deploy and operate Concourse CI in a single command"
  homepage "https://www.engineerbetter.com"
  license "Apache-2.0"
  version "0.15.2"

  if OS.mac?
    url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-darwin-amd64"
    sha256 "c52a4a0a85525f00ee6e0ea62332f370eff38ed56e2d159a066151dceabbd5a0"
  elsif OS.linux?
    url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-linux-amd64"
    sha256 "48c08cb6257daca772546e5a81d04d9781fa305b1f56bb4f5835309eba920dd5"
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

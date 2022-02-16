class ControlTower < Formula
  desc "Deploy and operate Concourse CI in a single command"
  homepage "https://www.engineerbetter.com"
  license "Apache-2.0"
  version "0.17.28"

  if OS.mac?
    url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-darwin-amd64"
    sha256 "3a224f24d7f48c76e4e1ccb837b0585452aef6b4815ab7db7f0b97efed5125e8"
  elsif OS.linux?
    url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-linux-amd64"
    sha256 "27e38cba0332fbc1f4737c64b3d315f21ed14f87feb0b63e44c3d934ebabc6fb"
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

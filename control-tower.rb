class ControlTower < Formula
  desc "Deploy and operate Concourse CI in a single command"
  homepage "https://www.engineerbetter.com"
  version "0.22.0"
  license "Apache-2.0"

  if OS.mac?
    if RUBY_PLATFORM.include?("arm64")
      url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-darwin-arm64"
      sha256 "bcba1866953ef4754aa410d7b1e15ea0b08ba85e011b018934f4c848a5d1799e"
    else
      url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-darwin-amd64"
      sha256 "9e78fdad0081b7b6048c79970855f7017170a2047424a0d856541ee6d990640e"
    end
  elsif OS.linux?
    url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-linux-amd64"
    sha256 "ee140713926c9fa5186d47fcd45de48dcda767cc96a48a8282d93e453a42d4e7"
  end

  def install
    binary_name = "control-tower"
    if OS.mac?
      if RUBY_PLATFORM.include?("arm64")
        bin.install "control-tower-darwin-arm64" => binary_name
      else
        bin.install "control-tower-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "control-tower-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/control-tower", "--help"
  end
end

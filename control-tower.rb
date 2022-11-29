class ControlTower < Formula
  desc "Deploy and operate Concourse CI in a single command"
  homepage "https://www.engineerbetter.com"
  version "0.29.0"
  license "Apache-2.0"

  if OS.mac?
    if RUBY_PLATFORM.include?("arm64")
      url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-darwin-arm64"
      sha256 "146416d3a580af294191f8ae41922d8dd75e9bd3912ec4188b06abe5a03c655b"
    else
      url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-darwin-amd64"
      sha256 "a11e1750fb85a05b0449bc1d65652427cb1d067d04cc88be9173374f9af4dffe"
    end
  elsif OS.linux?
    url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-linux-amd64"
    sha256 "c0e77ec3dfd797aaa25b32f2b15e2744c660ce8e791f6fe83990362a4bb85e2c"
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

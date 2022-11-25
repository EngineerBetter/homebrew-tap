class ControlTower < Formula
  desc "Deploy and operate Concourse CI in a single command"
  homepage "https://www.engineerbetter.com"
  version "0.28.0"
  license "Apache-2.0"

  if OS.mac?
    if RUBY_PLATFORM.include?("arm64")
      url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-darwin-arm64"
      sha256 "2d61fb310fe86cc42ce55033cb856949356df21dd91b0439804534d75f992014"
    else
      url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-darwin-amd64"
      sha256 "0396a3ee073222766f3657390d6b355c241a56990d9e14c6339eab78ae107f6b"
    end
  elsif OS.linux?
    url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-linux-amd64"
    sha256 "c799974ccb829111e58c0fc3c46dc667216715436f146422e9e60bcdf5a17e52"
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

class ControlTower < Formula
  desc "Deploy and operate Concourse CI in a single command"
  homepage "https://www.engineerbetter.com"
  version "0.26.0"
  license "Apache-2.0"

  if OS.mac?
    if RUBY_PLATFORM.include?("arm64")
      url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-darwin-arm64"
      sha256 "9090bff9622f901bd07d3a635dbd3cb78efa7a376007316f306f95fff3612ff3"
    else
      url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-darwin-amd64"
      sha256 "9c4fbb7b0c34beb78b1d6b92030b70983d42d66d98edf21158d251d86034508b"
    end
  elsif OS.linux?
    url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-linux-amd64"
    sha256 "4f033a9c00ae704ffcbe5e4a35430917a31a00d686e17a7fcdfba9a3c56e6c32"
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

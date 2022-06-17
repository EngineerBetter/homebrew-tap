class ControlTower < Formula
  desc "Deploy and operate Concourse CI in a single command"
  homepage "https://www.engineerbetter.com"
  version "0.20.4"
  license "Apache-2.0"

  if OS.mac?
    if RUBY_PLATFORM.include?("arm64")
      url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-darwin-arm64"
      sha256 "66555504abfc9f7baa331eb53823732716f14cbc8c18c7f4efe738e9ab9e22a2"
    else
      url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-darwin-amd64"
      sha256 "647bc35361db93f9b94e14a15d84a8a9ba0559b53f66fa11a3664f87c111da24"
    end
  elsif OS.linux?
    url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-linux-amd64"
    sha256 "ebae4302cba7dff7c0ebfd0dc115b81aef1a45f1010468907f7ca4b2fb145bb4"
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

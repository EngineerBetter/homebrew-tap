# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ControlTower < Formula
  desc "Deploy and operate Concourse CI in a single command"
  homepage "https://www.engineerbetter.com"
  url "https://github.com/EngineerBetter/control-tower/releases/download/0.12.9/control-tower-darwin-amd64"
  sha256 "49d3dc7df47d77c9e1edbb82fdd5f7bf43c84e1f0873396a097a1d40d8f39eeb"
  license "Apache-2.0"
  version "0.12.9"

  # depends_on "cmake" => :build

  def install
    bin.install "control-tower-darwin-amd64" => "control-tower"
  end

  test do
    system "#{bin}/control-tower --help"
  end
end


# desc "Deploy and operate Concourse CI in a single command"
# homepage "https://www.engineerbetter.com"
# url "https://github.com/EngineerBetter/control-tower/releases/download/0.12.9/control-tower-darwin-amd64"
# sha256 "49d3dc7df47d77c9e1edbb82fdd5f7bf43c84e1f0873396a097a1d40d8f39eeb"
# license "Apache-2.0"
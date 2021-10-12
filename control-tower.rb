class ControlTower < Formula
  desc "Deploy and operate Concourse CI in a single command"
  homepage "https://www.engineerbetter.com"
  license "Apache-2.0"
  version "0.16.37"

  if OS.mac?
    url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-darwin-amd64"
    sha256 "a71c8754f0facbf208dbc1bdfd8ea7081ca35e403bc55f478d6a860d78ac7d9a"
  elsif OS.linux?
    url "https://github.com/EngineerBetter/control-tower/releases/download/#{version}/control-tower-linux-amd64"
    sha256 "27528c164274888fb3cff7ed13c36b36bb7d58941e4463170bddbe3fd3ed8388"
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

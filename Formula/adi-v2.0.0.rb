class Adi < Formula
  desc "ADI Stable Diffusion"
  homepage "https://github.com/Windsander/ADI-Stable-Diffusion"
  version "v2.0.0"
  license "GPL-3.0 license"

  if Hardware::CPU.arm?
    url "https://github.com/Windsander/ADI-Stable-Diffusion/releases/download/release-v2.0.0/release-v2.0.0-macos-arm64.tar.gz"
    sha256 "5fc986cd7476558a1b9cbe16490a6c50810d9871c2507d301ab90711c04319d5"
  else
    odie "v2.0.0 ships no prebuilt package for this Mac architecture — please build from source (Method 3 in README)"
  end


  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    include.install Dir["include/*"]

    prefix.install "CHANGELOG.md"
    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  test do
    system "#{bin}/adi", "--version"
  end
end

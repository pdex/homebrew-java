class Conrad < Formula
  desc "Fetch java artifacts"
  homepage "https://github.com/pdex/conrad"
  url "https://github.com/pdex/conrad/releases/download/v1.0.0/conrad-1.0.0.jar"
  sha256 "8f7d6948daf3bbc8d6f2ee7e705ee25f501f4315887d2b27a5d890a072ba0a06"

  bottle :unneeded

  def install
    jar = "conrad-#{version}.jar"
    prefix.install jar
    (bin+"conrad").write <<-EOS.undent
      #!/bin/bash
      exec java -cp #{prefix}/#{jar} -Dconfig.file=conrad.conf pdex.conrad.Fetch "$@"
    EOS
  end

end

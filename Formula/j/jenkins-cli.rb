class JenkinsCli < Formula
  desc "CLI for jenkins"
  homepage "https://github.com/jenkins-zh/jenkins-cli"
  url "https://github.com/jenkins-zh/jenkins-cli/archive/refs/tags/v0.0.47.tar.gz"
  sha256 "4e78600e214c357c08a0a83fe9cc59214b0d050de07dbb469d9f226c8c37eabc"
  license "MIT"
  head "https://github.com/jenkins-zh/jenkins-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/linuxsuren/cobra-extension/version.version=#{version}
      -X github.com/linuxsuren/cobra-extension/version.commit=#{tap.user}
      -X github.com/linuxsuren/cobra-extension/version.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:, output: bin/"jcli")

    generate_completions_from_executable(bin/"jcli", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jcli version")

    (testpath/".jenkins-cli.yaml").write <<~EOS
      current: default
      configurations:
        default:
          url: http://localhost:8080
          username: admin
          token: admin
    EOS

    assert_equal "Name URL Description", shell_output("#{bin}/jcli config list").chomp
    assert_match "Cannot found Jenkins", shell_output("#{bin}/jcli plugin list 2>&1", 1)
  end
end

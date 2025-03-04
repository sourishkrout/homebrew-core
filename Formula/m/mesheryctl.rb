class Mesheryctl < Formula
  desc "Command-line utility for Meshery, the cloud native management plane"
  homepage "https://meshery.io"
  url "https://github.com/meshery/meshery.git",
      tag:      "v0.8.41",
      revision: "1172740dfb0bc6b104a58e7c4099bae4e31e03f8"
  license "Apache-2.0"
  head "https://github.com/meshery/meshery.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d3c492378eb71ff66688f6c6ded884a653d3968550227f8f2cf37b2e8a728058"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "d3c492378eb71ff66688f6c6ded884a653d3968550227f8f2cf37b2e8a728058"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "d3c492378eb71ff66688f6c6ded884a653d3968550227f8f2cf37b2e8a728058"
    sha256 cellar: :any_skip_relocation, sonoma:        "f852a035eea49ff9930bf0d58399393c6e6ca6ff14c313cb07c4883f09b0159f"
    sha256 cellar: :any_skip_relocation, ventura:       "f852a035eea49ff9930bf0d58399393c6e6ca6ff14c313cb07c4883f09b0159f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ac7915f30a74affa742973adbcb6f6706ce198e58bc01eb56320572381bf5dfa"
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"

    ldflags = %W[
      -s -w
      -X github.com/layer5io/meshery/mesheryctl/internal/cli/root/constants.version=v#{version}
      -X github.com/layer5io/meshery/mesheryctl/internal/cli/root/constants.commitsha=#{Utils.git_short_head}
      -X github.com/layer5io/meshery/mesheryctl/internal/cli/root/constants.releasechannel=stable
    ]

    system "go", "build", *std_go_args(ldflags:), "./mesheryctl/cmd/mesheryctl"

    generate_completions_from_executable(bin/"mesheryctl", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mesheryctl version 2>&1")
    assert_match "Channel: stable", shell_output("#{bin}/mesheryctl system channel view 2>&1")

    # Test kubernetes error on trying to start meshery
    assert_match "The Kubernetes cluster is not accessible.", shell_output("#{bin}/mesheryctl system start 2>&1", 1)
  end
end

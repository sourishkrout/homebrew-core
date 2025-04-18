class Certbot < Formula
  include Language::Python::Virtualenv

  desc "Tool to obtain certs from Let's Encrypt and autoenable HTTPS"
  homepage "https://certbot.eff.org/"
  url "https://files.pythonhosted.org/packages/bd/41/4c8b187388185475fc6a414368e92d07f1c1f4108bfb821409dd0853a739/certbot-3.3.0.tar.gz"
  sha256 "40482fde0dd36b08e811d847df40ed04b6a3da52979c55456384a96807801d07"
  license "Apache-2.0"
  head "https://github.com/certbot/certbot.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2f944d5a9b359d660f5f23dd89902f81e4c194cd47c192d1febbd284cd53f8fc"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "2f944d5a9b359d660f5f23dd89902f81e4c194cd47c192d1febbd284cd53f8fc"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "2f944d5a9b359d660f5f23dd89902f81e4c194cd47c192d1febbd284cd53f8fc"
    sha256 cellar: :any_skip_relocation, sonoma:        "66b0efb99ce423a8fb80751e003076ab7911a1390070d5810f27b44570c5c5e5"
    sha256 cellar: :any_skip_relocation, ventura:       "66b0efb99ce423a8fb80751e003076ab7911a1390070d5810f27b44570c5c5e5"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "a3ff64ac3f21ee135c9691967579a2f2073148fdda4c4c180a43b931b40d75b6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2f944d5a9b359d660f5f23dd89902f81e4c194cd47c192d1febbd284cd53f8fc"
  end

  depends_on "augeas"
  depends_on "certifi"
  depends_on "cryptography"
  depends_on "dialog"
  depends_on "python@3.13"

  uses_from_macos "libffi"

  resource "acme" do
    url "https://files.pythonhosted.org/packages/c9/5b/731cd971fd8fbb543be9d6e2bcba71d2d5dd01d454cb7ad9b0953fd6d21b/acme-3.3.0.tar.gz"
    sha256 "c026edc0db13a36fb80d802d2e0256525b52272543beca3b8ddf2264bd8ef1f8"
  end

  resource "certbot-apache" do
    url "https://files.pythonhosted.org/packages/dc/14/d111c7081e2bff94b623d173a1471f0f63037b0e18ce9c8788326153c202/certbot_apache-3.3.0.tar.gz"
    sha256 "803f0355f39a2fee2857526ca08690a7105e5dafaf9e11e98baf79ce7cc1531f"
  end

  resource "certbot-nginx" do
    url "https://files.pythonhosted.org/packages/c8/32/29ee768d6b8eab5dd726b1970a5caf71e688bd5020b0f24a74a36e6347b7/certbot_nginx-3.3.0.tar.gz"
    sha256 "1af5b570c4ad7fb204954ee00f8a07acd077777f819c67ee620e9e669e6475b0"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/16/b0/572805e227f01586461c80e0fd25d65a2115599cc9dad142fee4b747c357/charset_normalizer-3.4.1.tar.gz"
    sha256 "44251f18cd68a75b56585dd00dae26183e102cd5e0f9f1466e6df5da2ed64ea3"
  end

  resource "configargparse" do
    url "https://files.pythonhosted.org/packages/70/8a/73f1008adfad01cb923255b924b1528727b8270e67cb4ef41eabdc7d783e/ConfigArgParse-1.7.tar.gz"
    sha256 "e7067471884de5478c58a511e529f0f9bd1c66bfef1dea90935438d6c23306d1"
  end

  resource "configobj" do
    url "https://files.pythonhosted.org/packages/f5/c4/c7f9e41bc2e5f8eeae4a08a01c91b2aea3dfab40a3e14b25e87e7db8d501/configobj-5.0.9.tar.gz"
    sha256 "03c881bbf23aa07bccf1b837005975993c4ab4427ba57f959afdd9d1a2386848"
  end

  resource "distro" do
    url "https://files.pythonhosted.org/packages/fc/f8/98eea607f65de6527f8a2e8885fc8015d3e6f5775df186e443e0964a11c3/distro-1.9.0.tar.gz"
    sha256 "2fa77c6fd8940f116ee1d6b94a2f90b13b5ea8d019b98bc8bafdcabcdd9bdbed"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz"
    sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
  end

  resource "josepy" do
    url "https://files.pythonhosted.org/packages/c1/8a/cd416f56cd4492878e8d62701b4ad32407c5ce541f247abf31d6e5f3b79b/josepy-1.15.0.tar.gz"
    sha256 "46c9b13d1a5104ffbfa5853e555805c915dcde71c2cd91ce5386e84211281223"
  end

  resource "parsedatetime" do
    url "https://files.pythonhosted.org/packages/a8/20/cb587f6672dbe585d101f590c3871d16e7aec5a576a1694997a3777312ac/parsedatetime-2.6.tar.gz"
    sha256 "4cb368fbb18a0b7231f4d76119165451c8d2e35951455dfee97c62a87b04d455"
  end

  resource "pyopenssl" do
    url "https://files.pythonhosted.org/packages/9f/26/e25b4a374b4639e0c235527bbe31c0524f26eda701d79456a7e1877f4cc5/pyopenssl-25.0.0.tar.gz"
    sha256 "cd2cef799efa3936bb08e8ccb9433a575722b9dd986023f1cabc4ae64e9dac16"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/8b/1a/3544f4f299a47911c2ab3710f534e52fea62a633c96806995da5d25be4b2/pyparsing-3.2.1.tar.gz"
    sha256 "61980854fd66de3a90028d679a954d5f2623e83144b5afe5ee86f43d762e5f0a"
  end

  resource "pyrfc3339" do
    url "https://files.pythonhosted.org/packages/f0/d2/6587e8ec3951cbd97c56333d11e0f8a3a4cb64c0d6ed101882b7b31c431f/pyrfc3339-2.0.1.tar.gz"
    sha256 "e47843379ea35c1296c3b6c67a948a1a490ae0584edfcbdea0eaffb5dd29960b"
  end

  resource "python-augeas" do
    url "https://files.pythonhosted.org/packages/af/cc/5064a3c25721cd863e6982b87f10fdd91d8bcc62b6f7f36f5231f20d6376/python-augeas-1.1.0.tar.gz"
    sha256 "5194a49e86b40ffc57055f73d833f87e39dce6fce934683e7d0d5bbb8eff3b8c"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/5f/57/df1c9157c8d5a05117e455d66fd7cf6dbc46974f832b1058ed4856785d8a/pytz-2025.1.tar.gz"
    sha256 "c2db42be2a2518b28e65f9207c4d05e6ff547d1efa4086469ef855e4ab70178e"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/aa/63/e53da845320b757bf29ef6a9062f5c669fe997973f966045cb019c3f4b66/urllib3-2.3.0.tar.gz"
    sha256 "f8c5449b3cf0861679ce7e0503c7b44b5ec981bec0d1d3795a07f1ba96f0204d"
  end

  def install
    if build.head?
      head_packages = %w[acme certbot certbot-apache certbot-nginx]
      venv = virtualenv_create(libexec, "python3.13")
      venv.pip_install resources.reject { |r| head_packages.include? r.name }
      venv.pip_install_and_link head_packages.map { |pkg| buildpath/pkg }
      pkgshare.install buildpath/"certbot/examples"
    else
      virtualenv_install_with_resources
      pkgshare.install buildpath/"examples"
    end
  end

  test do
    assert_match version.to_s, pipe_output("#{bin}/certbot --version 2>&1")
    # This throws a bad exit code but we can check it actually is failing
    # for the right reasons by asserting. --version never fails even if
    # resources are missing or outdated/too new/etc.
    assert_match "Either run as root", shell_output("#{bin}/certbot 2>&1", 1)
  end
end

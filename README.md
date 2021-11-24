# tfwrap: Minimalist Terraform wrapper

**tfwrap** is a minimalist [Terraform][] wrapper, which can be used to execute
different versions of Terraform.  The desired version is read from
`.terraform-version` file in the current directory or from
`$TFWRAP_TERRAFORM_DEFAULT_VERSION` environment variable.

A separate script, `tfwrap-terraform-install` is provided to ease installation
of the individual Terraform binaries.

It is influenced by [tfenv][], but the intent is to keep it as simple as it can
be.

## Installation

You can install `tfwrap` and `tfwrap-terraform-install` with the included
`Makefile`:

```sh
sudo make install
```

This will copy the `tfwrap` and `tfwrap-terraform-install` scripts to
`/usr/local/bin` and create a symlink named `terraform` pointing to `tfwrap` in
the same directory.

If you want to install to an other directory, you can set the `PREFIX` variable
for the `make` command:

```sh
make PREFIX=~/.local install
```

`tfwrap` does not install Terraform CLI itself, you must install the desired
version manually.  Terraform CLI binaries can be downloaded and installed with
the included `tfwrap-terraform-install` script:

```sh
tfwrap-terraform-install -v TERRAFORM_VERSION
```

You must replace `TERRAFORM_VERSION` with the desired Terraform version number.

To verify the downloaded Terraform distribution make sure that HashiCorp's GPG
key is in the `trustedkeys.kbx` keyring:

```sh
gpg --keyring trustedkeys.kbx --recv-key C874011F0AB405110D02105534365D9472D7468F
```

Always check [HashiCorp's Security](https://www.hashicorp.com/security) page for
the correct key ID before importing.

## Usage

After installed the Terraform binary, run the command `tfwrap` (or `terraform`
if symlinked) in a Terraform module.

## Configuration

At startup `tfwrap` reads it's configuration from both
`$HOME/.config/tfwrap/tfwraprc` (respecting `$XDG_CONFIG_HOME`) and
`$HOME/.tfwraprc` in this order.  When the environment variable `TFWRAP_RC` is
defined and it's value is a readable file, then configuration is read only from
that file, the above configuration files are skipped.

The following variables can be used to configure `tfwrap`.  These can be set as
environment variables as well:

* `TFWRAP_DEBUG`: If set to any non-empty value then `tfwrap` will print debug
  information to stderr.
* `TFWRAP_SKIP_RC`: If set to any non-empty value then no configuration file is
  read.
* `TFWRAP_RC`: Configuration file location.
* `TFWRAP_TERRAFORM_BASEDIR`: Base directory where `tfwrap` looks for a
  Terraform binary to pass execution to.  It defaults to
  `$HOME/.local/libexec/terraform`.
* `TFWRAP_TERRAFORM_DISTDIR`: Base directory where `tfwrap-terraform-install`
  puts the downloaded distribution zip files.  It defaults to
  `$HOME/.terraform.d/dist-cache`.
* `TFWRAP_TERRAFORM_DEFAULT_VERSION`: If set to any non-empty value, then
  `tfwrap` will use it's value if there is no `.terraform-version` file present
  in the current directory.
* `TFWRAP_TERRAFORM_AUTO_INSTALL`: If set to any non-empty value, then
  `tfwrap` will try to install the desired version of Terraform CLI if not
  found.
* `TFWRAP_TERRAFORM_SKIP_VERIFY`: If set to any non-empty value then
  `tfwrap-terraform-install` will not verify the downloaded distribution zip
  file with GnuPG.
* `TFWRAP_TERRAFORM_SKIP_EXTRACT`: If set to any non-empty value then
  `tfwrap-terraform-install` will not extract the downloaded distribution zip
  file to `$TFWRAP_TERRAFORM_BASEDIR`.

[Terraform]: https://www.terraform.io/
[tfenv]: https://github.com/tfutils/tfenv

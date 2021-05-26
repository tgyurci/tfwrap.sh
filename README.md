# tfwrap: Minimalist Terraform wrapper

**tfwrap** is a minimalist [Terraform][] wrapper, which can be used to execute
different versions of Terraform.  The desired version is read from
`.terraform-version` file it the current directory.

It is influenced by [tfenv][], but the intent is to keep it as simple as it can
be.

## Installation

Copy the `tfwrap` file into a directory which is on `$PATH`:

```sh
sudo cp tfwrap /usr/local/bin
```

Or just install it for the current user:

```sh
cp tfwrap ~/.local/bin
```

Additionally, you can create a symlink named `terraform` to "hide" the actual
wrapper:

```sh
sudo ln -s /usr/local/bin/tfwrap /usr/local/bin/terraform
```

Or for the current user:

```sh
ln -s ~/.local/bin/tfwrap ~/.local/bin/terraform
```

## Usage

`tfwrap` does not install Terraform CLI itself, you must install the desired
version manually.  Terraform binaries are looked for by default in the path
`~/.local/libexec/terraform/VERSION/terraform`.

You can download different versions of Terraform CLI from here:
https://releases.hashicorp.com/terraform/

After installed the proper Terraform binary, run the command `tfwrap` (or
`terraform` if symlinked) in a Terraform module, which contains a
`.terraform-version` file.

## Configuration

At startup `tfwrap` reads it's configuration from both
`$HOME/.config/tfwrap/tfwraprc` and `$HOME/.tfwraprc` in this order.  When the
environment variable `TFWRAP_RC` is defined and it's value is a readable file,
then configuration is read only from that file, the above configuration files
are skipped.

The following variables can be set to configure `tfwrap`.  These can be set as
an environment variable as well:

* `TFWRAP_DEBUG`: If set to any non-empty value then `tfwrap` will print debug information to
  stderr
* `TFWRAP_SKIP_RC`: If set to any non-empty value then no configuration file is
  read
* `TFWRAP_RC`: Configuration file location
* `TFWRAP_TERRAFORM_BASEDIR`: Base directory where `tfwrap` looks for a
  Terraform binary to pass execution to.  It defaults to
  `$HOME/.local/libexec/terraform`.

[Terraform]: https://www.terraform.io/
[tfenv]: https://github.com/tfutils/tfenv

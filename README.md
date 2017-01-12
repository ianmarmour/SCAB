# What's SCAB

SCAB or Security Center Asset Builder is a tool that is intended to be used as an asset provider for Teneable's Security Center. It was created due to the slow speeds that Security Center achieves when attempting to scan large IP segements I.E. /8's. This tool relies on an asynchronus port scanner to quickly identify active hosts to included in an identified asset list in Teneable's Security Center to launch scans against.

## Features of SCAB
* Simple to use
* Simple to automate with bash scripting or other automation tools.
* Provides a large amount of configuration options in a static configuration file
* Provides the ability to run without a configuration file present using command line switches (use case is integration in other scripts/tools)
* Error handling of REST/HTTP errors.

## Dependencies
* JSON Ruby Gem
* Colorize Ruby Gem
* OptionParser Ruby Gem
* Massscan (Compile and install from source, or install binary)

## How to Install SCAB

Using git use the following command:

`git clone git://github.com/ianmarmour/SCAB/SCAB.git`


## Sample Syntax

### Command Line Usage

`ruby scab.rb -r 192.0.0.0/8 -u john.doe -p janedoe2014! -s 151.1.1.2 -a 32 -l 17`

-r | --range = The IP ranges to scan seperated by comma's

-u | --user = The Security Center user (Must have Security Manager rights on the server)

-p | --password = The Security Center user's password

-s | --server = The Security Center IP Address or Hostname

-a | --assetlist = The Security Center Asset Lists ID

-c | --config = The configuration file location/name

-l | --launch = The scan ID that you wish to launch after asset list compilation has been completed. (This is not required)

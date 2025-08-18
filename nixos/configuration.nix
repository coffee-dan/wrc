# This file and hardware-configuration are now just a compatibility layer.
# The actual configuration has been moved to the hosts directory.
# These files are kept for backward compatibility with tools that expect it.

{ config, pkgs, inputs, ... }:
{
  # Import the host configuration for nixchan
  imports = [ ./hosts/bluemoon ];
}

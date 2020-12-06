Creating volume and mountpoint /nix.

     ------------------------------------------------------------------ 
    | This installer will create a volume for the nix store and        |
    | configure it to mount at /nix.  Follow these steps to uninstall. |
     ------------------------------------------------------------------ 

  1. Remove the entry from fstab using 'sudo vifs'
  2. Destroy the data volume using 'diskutil apfs deleteVolume'
  3. Remove the 'nix' line from /etc/synthetic.conf or the file



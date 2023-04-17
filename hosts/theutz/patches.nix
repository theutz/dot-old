{ pkgs, ... }:
{
    system.patches = [
      (pkgs.writeText "pam.patch" ''
        --- a/etc/pam.d/sudo
        +++ b/etc/pam.d/sudo
        @@ -1,4 +1,6 @@
         # sudo: auth account password session
        +auth       optional       ${pkgs.pam-reattach}/lib/pam/pam_reattach.so # Needed for using Touch ID within tmux
        +auth       sufficient     pam_tid.so
         auth       sufficient     pam_smartcard.so
         auth       required       pam_opendirectory.so
         account    required       pam_permit.so
      '')
    ];
}

{ config, lib, pkgs, ... }:
{
services.xserver.videoDrivers = [ "modesetting" ];

hardware.graphics = {
  enable = true;
  extraPackages = with pkgs; [
    intel-media-driver     # VA-API (iHD) userspace
    vpl-gpu-rt             # oneVPL (QSV) runtime

    intel-compute-runtime  
	];
};

environment.sessionVariables = {
  LIBVA_DRIVER_NAME = "iHD";     };
hardware.enableRedistributableFirmware = true;
boot.kernelParams = [ "i915.enable_guc=3" ];
}

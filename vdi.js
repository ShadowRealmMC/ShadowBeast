function patch(mode)
{
    FS.copy("instance." + mode +".cfg", "instance.cfg");
    FS.copy(".minecraft/config/betterfoliage." + mode + ".cfg", ".minecraft/config/betterfoliage.cfg");
    FS.copy(".minecraft/config/foamfix." + mode + ".cfg", ".minecraft/config/foamfix.cfg");
}

patch(Fly.getParameter(0));
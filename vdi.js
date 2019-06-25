function patch(mode)
{
    FS.copy("instance." + mode +".cfg", "instance.cfg");
    FS.copy(".minecraft/config/betterfoliage." + mode + ".cfg", ".minecraft/config/betterfoliage.cfg");
    FS.copy(".minecraft/config/Weather2/Particle." + mode + ".cfg", ".minecraft/config/Weather2/Particle.cfg");
    FS.copy(".minecraft/config/foamfix." + mode + ".cfg", ".minecraft/config/foamfix.cfg");
    FS.copy(".minecraft/options." + mode + ".txt", ".minecraft/options.txt");
    FS.copy(".minecraft/config/itlt." + mode + ".cfg", ".minecraft/config/itlt.cfg");
    FS.copy(".minecraft/config/itlt/icon." + mode + ".png", ".minecraft/config/itlt/icon.png");
    FS.copy(".minecraft/config/smoothfont/smoothfont." + mode + ".cfg", ".minecraft/config/smoothfont/smoothfont.cfg");
    FS.copy(".minecraft/resources/assets/fml/textures/gui/forge." + mode + ".gif", ".minecraft/resources/assets/fml/textures/gui/forge.gif");
    FS.copy(".minecraft/resources/assets/fml/textures/gui/florb." + mode + ".gif", ".minecraft/resources/assets/fml/textures/gui/florb.gif");
}

patch(Fly.getParameter(0));
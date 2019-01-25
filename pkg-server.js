var clientsideMods = [
  "[1.12]+RPG-HUD-3.6.6.2.jar",
  "[1.12]+VersionChecker-1.3.0.jar",
  "BackTools-1.12.2-7.0.0.jar",
  "BetterFoliage-MC1.12-2.2.0.jar",
  "BetterFps-1.4.8.jar",
  "Blur-1.0.4-14.jar",
  "ChunkAnimator-MC1.12-1.2.jar",
  "ClientTweaks_1.12.2-3.1.11.jar",
  "Controlling-3.0.6.jar",
  "crosshairmod-v0.8.2-forge-mc1.12.jar",
  "CTM-MC1.12.2-0.3.2.20.jar",
  "CustomMainMenu-MC1.12.2-2.0.8.jar",
  "f5fix-1.2.jar",
  "FancyBlockParticles-1.12.x-2.4.1.jar",
  "foamfix-0.10.2-1.12.2.jar",
  "FpsReducer-1.12.2-1.10.2.jar",
  "GooglyEyes-1.12.2-7.0.2.jar",
  "inventory_x-1.12-1.0.2.jar",
  "InventoryTweaks-1.63.jar",
  "itlt-1.12-1.0.0.jar",
  "keywizard-1.12.2-1.5.2.jar",
  "MobAmputation-1.12.2-7.0.0.jar",
  "MobDismemberment-1.12.2-7.0.0.jar",
  "mobends-0.24_for_MC-1.12.jar",
  "MouseTweaks-2.8-mc1.12.1.jar",
  "OptiFine_1.12.2_HD_U_E2.jar",
  "reauth-3.6.0.jar",
  "ResourceLoader-MC1.12.1-1.5.3.jar",
  "sampler-1.80.jar",
  "SmoothFont-mc1.12.2-1.16.1.jar",
  "SoundFilters-0.10_for_1.12.jar",
  "stg-1.12.2-1.2.3.jar",
  "TexFix+V-1.12-4.0.jar",
  "Toast+Control-1.12.2-1.7.1.jar"
];

function run()
{
  Fly.log("Packaging Server...");
  clean();
  createServer();
  copyMods();
  copyConfigs();
  deleteClientMods();
}

function createServer()
{
  FS.copy("lib", "server");
  // Apply Server Icon
  FS.copy(".minecraft/config/itlt/icon-64.png", "server/server-icon.png");
}

function clean()
{
  Fly.log("Cleaning...");
  FS.delete("server");
}

function copyMods()
{
  Fly.log("Installing Mods...");
  FS.copy(".minecraft/mods", "server/mods");
}

function copyConfigs()
{
  Fly.log("Configuring Mods...");
  FS.copy(".minecraft/config", "server/config");
}

function deleteClientMods()
{
  Fly.log("Deleting Client Mods...");
  Fly.log("Loading Mod Package Lists...");

  clientsideMods.forEach(function(x)
  {
    FS.delete("server/mods/" + x);
  });
}

run();

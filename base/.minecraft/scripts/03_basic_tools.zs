#Name: basic_tools.zs
#Author: ShadowBeast

print("Initializing 'basic_tools.zs'...");

mods.initialinventory.InvHandler.addStartingItem(<embers:pickaxe_tin>, 0);
mods.initialinventory.InvHandler.addStartingItem(<embers:axe_tin>, 1);
mods.initialinventory.InvHandler.addStartingItem(<embers:sword_tin>, 2);
mods.initialinventory.InvHandler.addStartingItem(<actuallyaditions:item_coffee>, 6);
mods.initialinventory.InvHandler.addStartingItem(<realistictorches:matchbox>, 7);
// Akashic Tome uses slot 8

print("Initialized 'basic_tools.zs'");
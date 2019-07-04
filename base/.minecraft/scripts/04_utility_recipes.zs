#Name: utility_recipes.zs
#Author: ShadowBeast

print("Initializing 'utility_recipes.zs'...");

recipes.addShapeless(<minecraft:redstone>, [<projectred-core:resource_item:105>]);
recipes.addShapeless(<projectred-core:resource_item:105>, [<minecraft:redstone>]);
recipes.addShapeless(<spectrite:spectrite_star>, [<spectrite:spectrite_gem>,<minecraft:nether_star>,<thermalfoundation:material:1024>,<thaumcraft:salis_mundus>]);
recipes.addShapeless(<enderio:item_material:20> * 16, [<bedrockminer:bedrock_chunk>,<minecraft:flint>,<thermalfoundation:material:1024>]);
print("Initialized 'utility_recipes.zs'");
@echo off
echo Configuration Mode: Potato
java -jar Firefly.jar vdi.js potato
cd ..
cd ..
echo Starting ShadowBeast...
MultiMC -l "ShadowBeast"
echo ShadowBeast is launching. This window will close automatically.
TIMEOUT /T 10
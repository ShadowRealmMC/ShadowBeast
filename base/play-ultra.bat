@echo off
echo Configuration Mode: Ultra
java -jar Firefly.jar vdi.js ultra
cd ..
cd ..
echo Starting ShadowBeast...
MultiMC -l "ShadowBeast"
echo ShadowBeast is launching. This window will close automatically.
sleep 10
#!/bin/bash
DIR=`dirname ${BASH_SOURCE[0]}`
source $DIR/../../../util.sh


BEGIN_STEPS 3

STEP "Install Paper 1.19.2-201"
DOWNLOAD "https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/201/downloads/paper-1.19.2-201.jar" INTO "server.jar"

BEGIN_SUBSTEP 11 "Install Plugins"
RUN mkdir -p $DIR/plugins

SUBSTEP "BlueMap"
DOWNLOAD "https://github.com/BlueMap-Minecraft/BlueMap/releases/download/v3.4/BlueMap-3.4-spigot.jar" INTO "plugins/BlueMap 3.4.jar"
# DOWNLOAD_PLUGIN "83557" VERSION "469275" INTO "plugins/BlueMap 3.4.jar"

SUBSTEP "CommandHelper"
DOWNLOAD "https://apps.methodscript.com/builds/commandhelperjar/build-280%2Fcommandhelper-3.3.5-SNAPSHOT-full.jar" INTO "plugins/commandhelper-3.3.5-SNAPSHOT-full-build-280.jar"
# DOWNLOAD_PLUGIN "64681" VERSION "404127" INTO "plugins/commandhelper-3.3.5-SNAPSHOT-full-build-280.jar"

SUBSTEP "GeyserMC"
DOWNLOAD "https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/1211/artifact/bootstrap/spigot/build/libs/Geyser-Spigot.jar" INTO "plugins/Geyser-Spigot-build-1211.jar"

SUBSTEP "GeyserMC - Floodgate"
DOWNLOAD "https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/73/artifact/spigot/build/libs/floodgate-spigot.jar" INTO "plugins/floodgate-spigot-build-72.jar"

SUBSTEP "Graves"
SKIPPED "This plugin cannot be easily obtainable from the internet; The plugin has been pre-fetched."
# DOWNLOAD_PLUGIN "96774" VERSION "465387" INTO "plugins/Graves 4.9.jar"

SUBSTEP "Graves Integration: PlayerNPC"
SKIPPED "This plugin cannot be easily obtainable from the internet; The plugin has been pre-fetched."
# DOWNLOAD_PLUGIN "93625" VERSION "465238" INTO "plugins/PlayerNPC 2022.8.jar"

SUBSTEP "ChestSort"
SKIPPED "This plugin cannot be easily obtainable from the internet; The plugin has been pre-fetched."
# DOWNLOAD_PLUGIN "59773" VERSION "471019" INTO "plugins/ChestSort 13.4.0.jar"

SUBSTEP "LuckPerms"
SKIPPED "This plugin cannot be easily obtainable from the internet; The plugin has been pre-fetched."
# DOWNLOAD_PLUGIN "28140" VERSION "463843" INTO "plugins/LuckPerms-Bukkit-5.4.40.jar"

SUBSTEP "CoreProtect"
DOWNLOAD "https://github.com/PlayPro/CoreProtect/releases/download/v21.2/CoreProtect-21.2.jar" INTO "plugins/CoreProtect-21.2.jar"

SUBSTEP "DiscordSRV"
DOWNLOAD "https://lol.scarsz.me/RlLqpp/DiscordSRV-Build-1.26.0.jar" INTO "plugins/DiscordSRV-Build-1.26.0.jar"

SUBSTEP "SimpleNoCropTrample"
DOWNLOAD "https://github.com/KettleMC-Network/SimpleNoCropTrample/releases/download/1.0.0/SimpleNoCropTrample.jar" INTO "plugins/SimpleNoCropTrample 1.0.0.jar" 

SUBSTEP "RHLeafDecay"
SKIPPED "This plugin cannot be easily obtainable from the internet; The plugin has been pre-fetched."
# DOWNLOAD_PLUGIN "83581" VERSION "472238" INTO "plugins/RHLeafDecay-1.19_R3.jar"

STEP "Copy Base Configurations"
RUN cp $DIR/baseconfig/server.properties $DIR/server.properties
RUN cp $DIR/baseconfig/spigot.yml $DIR/spigot.yml
RUN cp $DIR/baseconfig/config/paper-global.yml $DIR/config/paper-global.yml
RUN cp $DIR/baseconfig/plugins/Geyser-Spigot/config.yml $DIR/plugins/Geyser-Spigot/config.yml

FAKERUN "(set -a; source $DIR/../../.env; envsubst < $DIR/baseconfig/plugins/DiscordSRV/config.yml > $DIR/plugins/DiscordSRV/config.yml)"
(set -a; source $DIR/../../.env; envsubst < $DIR/baseconfig/plugins/DiscordSRV/config.yml > $DIR/plugins/DiscordSRV/config.yml)

DONE "Server Installation"

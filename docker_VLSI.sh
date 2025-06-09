# https://docs.docker.com/engine/install/ubuntu/ has info on downloading docker

# download docker image of openlane
wget -c https://drive.google.com/file/d/1sCIuxsfbQoDngjvcugqWjPbbzf2cjRjc/view?usp=sharing -o ~/Downloads/openlane_backup.tar

# Step 1: Run Docker Hello World to verify Docker installation
docker run hello-world

# Step 2: Load OpenLane Docker Image (downloaded beforehand)
docker load -i ~/Downloads/openlane_backup.tar

# Step 3: Check if the image was loaded correctly
docker images

# Step 4: Enable X11 GUI access from Docker (for schematic/GUI tools)
echo $DISPLAY
xhost +local:docker

# Step 5: Find running OpenLane container (if already running)
sudo docker ps

# Step 6: Access the container with root privileges
sudo docker exec -u root -it <container_name_or_id> bash

# Step 7: Inside Docker now. Create a new design folder
mkdir assignment && cd assignment

# Step 8: Add RTL design files
nano ALU_OP1.v # paste your codes here. ctrl+shift+v, ctrl+s, then ctrl+x to exit
nano ALU_OP2.v
nano ALU.v
nano TOP.v
nano CONTROLLER.v
nano config.json      # Define top module and paths here

# demo config.json. change design name, verilog files density, clock, etc as needed
# {
#   "DESIGN_NAME": "CPU",
#   "VERILOG_FILES": ["dir::ALU_OP1.v", "ALU_OP2.v", "ALU.v", "CONTROLLER.v", "TOP.v"],
#   "CLOCK_PERIOD": 25.0,
#   "CLOCK_PORT": "clk",
#   "SYNTH_STRATEGY": "DELAY 4",
#   "FP_IO_MIN_DISTANCE": 1,
#   "FP_CORE_UTIL": 70,
#   "FP_SIZING": "absolute",
#   "DIE_AREA": "0 0 50 50",
#   "PLACE_DENSITY": 0.75,
#   "PL_TARGET_DENSITY": 0.85
# }


# Step 9: Run OpenLane full flow using the config
openlane config.json


# RTL Power Analysis
cd /foss/designs/assi/runs/RUN_<timestamp>/54-openroad-stapostpnr/nom_tt_025C_1v80
less power.rpt     # View estimated power after place-and-route


# Floorplan log shows core and die dimensions
cd /foss/designs/assi/runs/RUN_<timestamp>/13-openroad-floorplan
less openroad-floorplan.log


# RTL synthesis summary, Standard cell usage in synthesized design
cd /foss/designs/assi/runs/RUN_<timestamp>/06-yosys-synthesis
less yosys-synthesis.log         # Includes number of logic cells used. Summary of cell counts
# less statistics.txt              # Summary of cell counts, types

# RTL synthesized design figure
cd /foss/designs/assi/runs/RUN_<timestamp>/06-yosys-synthesis
dot -Tpng hierarchy.dot -o hierarchy.png
xdot #then click the .dot file. or xdot hierarchy.dot


# Layout
cd /foss/designs/assi/runs/RUN_2025-06-09_01-08-09/final/gds
klayout not.gds

# Heatmap
cd /foss/designs/assi/runs/RUN_2025-06-09_01-08-09/final/odb
openroad -gui

# 🧰 OpenLane Workflow (Ubuntu + Docker)
This is a complete step-by-step guide for running an OpenLane-based RTL-to-GDSII flow using Docker on Ubuntu. It includes power analysis, RTL schematics, standard cell usage, layout view, and heatmap analysis.

---

## 📦 0. Prerequisite
- 🐧 OS: Ubuntu 20.04+ (tested on 24.04)
- 🧱 Install Docker:  
  👉 Refer: [Docker Install Docs](https://docs.docker.com/engine/install/ubuntu/)

---

## 📥 1. Download OpenLane Docker Image
 Provided docker image in [GDrive](https://drive.google.com/uc?export=download&id=1sCIuxsfbQoDngjvcugqWjPbbzf2cjRjc) is 14.8 GB. So, make sure you have stable network connection and enough data. 
 Use download manager(FDM, IDM, etc). Otherwise use `wget -c <file_url>` if direct link is available. browser may not completely download the tar file as it is too big and any disruption in network or PC going to sleep would stop the download.
```bash
# Download from provided Google Drive.
wget -c "https://drive.google.com/uc?export=download&id=1sCIuxsfbQoDngjvcugqWjPbbzf2cjRjc" -O ~/Downloads/openlane_backup.tar
````

---

## 🚀 2. Load Docker Image & Run Hello World
```bash
# Verify Docker installation
docker run hello-world

# Load OpenLane image
docker load -i ~/Downloads/openlane_backup.tar

# Check image list
docker images
```

---

## 🖥️ 3. Enable GUI for Schematic/Layout Viewing
```bash
# Enable display forwarding
echo $DISPLAY
xhost +local:docker
```

---

## 🐳 4. Enter Docker Container
```bash
# Get container ID or name
sudo docker ps

# Enter the container as root
sudo docker exec -u root -it <container_id_or_name> bash
```

---

## 🏗️ 5. Setup RTL Project
```bash
# Inside the container
mkdir assignment && cd assignment

# Add your RTL modules
nano ALU_OP1.v
nano ALU_OP2.v
nano ALU.v
nano TOP.v
nano CONTROLLER.v
nano config.json  # Set top_module, source files, PDK, etc.
```

> ✅ Use `Ctrl+Shift+V` to paste, `Ctrl+S` to save, `Ctrl+X` to exit nano.

This is a demo `config.json`. Change design name, verilog files, density, clock, etc as needed.
```json
{        //config.json
	"DESIGN_NAME": "CPU",
	"VERILOG_FILES": ["dir::ALU_OP1.v", "ALU_OP2.v", "ALU.v", "CONTROLLER.v", "TOP.v"], //don't put testbench files(alu_tb.v) here
	"CLOCK_PERIOD": 25.0,
	"CLOCK_PORT": "clk",
	"SYNTH_STRATEGY": "DELAY 4",
	"FP_IO_MIN_DISTANCE": 1,
	"FP_CORE_UTIL": 70,
	"FP_SIZING": "absolute",
	"DIE_AREA": "0 0 50 50",
	"PLACE_DENSITY": 0.75,
	"PL_TARGET_DENSITY": 0.85
}
```

---

## 🔁 6. Run OpenLane Flow
```bash
openlane config.json
```

---

## 📊 7. Reports & Analysis

### 🔌 RTL Power Report (Post-PnR)
```bash
cd /foss/designs/assi/runs/RUN_<timestamp>/54-openroad-stapostpnr/nom_tt_025C_1v80
less power.rpt
```

> Press `Ctrl+Z` to exit *less*
---

### 🧱 Die and Core Area
```bash
cd /foss/designs/assi/runs/RUN_<timestamp>/13-openroad-floorplan
less openroad-floorplan.log
```

---

### 📈 RTL Synthesis Summary & Standard Cell Usage
```bash
cd /foss/designs/assi/runs/RUN_<timestamp>/06-yosys-synthesis
less yosys-synthesis.log   # RTL logic summary
# less statistics.txt      # Optional: detailed cell usage
```

---

### 🧠 RTL Design Figure (Graphviz)
```bash
dot -Tpng hierarchy.dot -o hierarchy.png
xdot hierarchy.dot              # View interactive schematic
```

---

### 🧾 GDSII Layout
```bash
cd /foss/designs/assi/runs/RUN_<timestamp>/final/gds
klayout final.gds
```

---

### 🌡️ Heatmap via OpenROAD GUI
```bash
cd /foss/designs/assi/runs/RUN_<timestamp>/final/odb
openroad -gui
```

---

## 🧷 Tips
- `<timestamp>` = run time like `RUN_2025-06-09_01-08-09`
- Run `openroad` only from inside the Docker container
- Use `root` inside Docker to avoid permission issues
---

## ✅ Summary Checklist
-  Docker + OpenLane loaded
-  RTL added + config created
-  Flow completed successfully
-  Power & area reports generated
-  RTL schematic image created
-  GDS layout viewed in KLayout
-  Heatmap visualized in OpenROAD

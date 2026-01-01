# Bald B in Where Are My Veggies?
## A Playable Game of Life on the Nintendo Entertainment System (NES)


This repository contains the complete source code, assets, and build materials for Bald B: Where Are My Veggies?, a fully playable Nintendo Entertainment System (NES/Famicom) game that embeds Conway’s Game of Life as a core gameplay mechanic for artificial life and educational purposes.

The project accompanies the manuscript:

Vegetables, Enemies, and Emergence: A Playable Game of Life on Nintendo for Educational Purposes
(submitted to the International Journal of Innovations in Machine Intelligence)

### 📌 Project Overview

Platform: Nintendo Entertainment System / Famicom

Genre: Educational game, Artificial Life, Retro Game

Core Concept:
A two-phase game in which player actions (vegetable collection under risk) determine the initial conditions of a real-time Game of Life simulation, executed under authentic NES hardware constraints.

The project demonstrates that emergent artificial-life behavior can be implemented and meaningfully explored on severely constrained 8-bit hardware, using careful algorithmic design, palette-based state encoding, and cycle-accurate programming.

### 🧠 Scientific Contribution

This repository supports reproducibility of the following contributions:

A cycle-accurate Game of Life kernel implemented in 6502 assembly (CA65)

A palette-based binary state encoding compatible with NES PPU timing

A serpentine grid traversal strategy for efficient VRAM updates

A guided randomness design that exposes players to:

emergence

persistence

unpredictability

non-trivial temporal evolution

Integration of an artificial-life system into a fully playable NES game loop

### ▶️ Playing the Game
Online Emulator

A fully playable version of the ROM is available online (no installation required):

🔗 https://theretroverse.com/product/bald-b-in-where-are-my-veggies/

Local Execution

You may also run the ROM locally using standard NES emulators such as:

Mesen

FCEUX

Nestopia

### 🔁 Reproducibility

This repository is designed to support full reproducibility of the published work:

All Game of Life logic is implemented in deterministic CA65 assembly

Timing-critical routines are cycle-counted for NTSC hardware

No hidden dependencies or proprietary binaries are required

Given identical inputs and ROM, behavior is deterministic across emulators and real hardware

###📌🛠 Build Requirements

To rebuild the ROM from source, you will need:

* * CC65 toolchain (ca65, ld65)

* * NESmaker (for project structure and asset integration)

* * NES Screen Tool (CHR/tile assets)

* * FamiTracker (audio)

* * A standard NES emulator for testing


### 📄 License

This project is released for academic, educational, and research use.

Unless otherwise noted:

Source code: MIT License

Art assets and documentation: CC BY-NC 4.0

Please cite the associated publication when using this work in academic contexts.

### 📚 Citation

Pending for publication resource to become available

### 👤 Author

Bruno Senzio-Savino Barzellato
SenzioTek S. de R.L.
Graduate School of Science and Engineering (Research Collaboration), Yamagata University

### 🧭 Notes

This repository corresponds to the post-review revised version of the manuscript.

Earlier experimental commits may not reflect the final publication behavior.

Issues and pull requests are welcome for educational extensions or verification.




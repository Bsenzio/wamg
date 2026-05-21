<img src="https://anonymous.4open.science/r/wamg-5913/BaldBRepoTitle.jpg" width="400" />

# Bald B in Where Are My Veggies?

### A Playable Game of Life on the Nintendo Entertainment System (NES)

This repository contains the complete source code, assets, and build materials for *Bald B in Where Are My Veggies?*, a fully playable Nintendo Entertainment System (NES/Famicom) game 
that embeds Conway’s Game of Life as a core gameplay mechanic for artificial life and educational purposes.

The project accompanies the manuscript (*under revision*):

*Vegetables, Enemies, and Emergence: A Playable Game of Life on Nintendo for Educational Purposes*

(*submitted to the International Journal of Innovations in Machine Intelligence*)

## 📌 Project Overview

*Platform*: *Nintendo Entertainment System / Famicom*

*Genre*: *Educational game, Artificial Life, Retro Game*

<img src="https://anonymous.4open.science/r/wamg-5913/ROM/Screenshots/game_000.png" width="200" /><img src="https://anonymous.4open.science/r/wamg-5913/ROM/Screenshots/game_017.png" width="200" /><img src="https://anonymous.4open.science/r/wamg-5913/ROM/Screenshots/game_020.png" width="200" /><img src="https://anonymous.4open.science/r/wamg-5913/ROM/Screenshots/wamv2_0_000.png" width="200" />



**Core Concept**:

A two-phase game in which player actions (vegetable collection under risk) determine the initial conditions of a real-time Game of Life simulation, 
executed under authentic NES hardware constraints.

The project demonstrates that emergent artificial-life behavior can be implemented and meaningfully explored on severely constrained 8-bit hardware, 
using careful algorithmic design, palette-based state encoding, and cycle-accurate programming.

## 🧠 Scientific Contribution

This repository supports reproducibility of the following contributions:

* A cycle-accurate Game of Life kernel implemented in 6502 assembly (CA65)

* A palette-based binary state encoding compatible with NES PPU timing

* A serpentine grid traversal strategy for efficient VRAM updates

* A guided randomness design that exposes players to: emergence, persistence, unpredictability, non-trivial temporal evolution

Integration of an artificial-life system into a fully playable NES game loop

## ▶️ Playing the Game

Online Emulator

A fully playable version of the ROM is available online (no installation required):

🔗 <a href="https://theretroverse.com/product/bald-b-in-where-are-my-veggies/">Online Demo</a>

Local Execution

You may also run the ROM locally using standard NES emulators such as:

* *Mesen*
* *FCEUX*
* *Nestopia*

## 🎮 Gameplay Video

A short gameplay and technical demonstration video of **Bald B: Where Are My Veggies?**
is available as well

The video showcases:
- *Phase 1*: Vegetable budget collection and enemy interaction  
- *Phase 2*: Game of Life simulation on NES hardware  
- **Real-time** palette-based cell updates  
- Serpentine traversal and **VBlank-safe** execution

## 📦 Physical Media and Printed Materials

<img src="https://anonymous.4open.science/r/wamg-5913/NESHomebrews.jpg" width="400" />

This repository also includes all materials required to reproduce the **physical edition**
of the game for educational and archival purposes.

The following items are provided:

- 📘 **Printed Game Manual** (`.pdf` *print-ready design*)
  Explains Game of Life concepts, artificial life principles, and gameplay mechanics in a
  pedagogical format suitable for children, adolescents, and general audiences.

- 🖼 **Box Art** (`.pdf` *print-ready design*)
  Designed following classic NES packaging proportions for educational or exhibition use.

- 🏷 **Cartridge Label Artwork** (`.pdf` *print-ready design*)
  Ready-to-print label design compatible with standard NES cartridges.

These materials support **diversified pedagogical approaches**, combining:
physical interaction, visual learning, and embodied gameplay with artificial-life concepts.

## 🔁 Reproducibility

This repository is designed to support full reproducibility of the published work:

* All Game of Life logic is implemented in *deterministic CA65 assembly*
* *Timing-critical* routines are *cycle-counted* for NTSC hardware
* No hidden dependencies or proprietary binaries are required
* Given identical inputs and ROM, behavior is *deterministic* across emulators and real hardware

### Reproducibility Notes

The repository contains:
- Complete CA65 assembly source code for the Game of Life kernel and gameplay logic
- NESmaker project files (`.mod` and `.mst` with backup variants) as used in development
- Compiled ROMs (`.nes`) for immediate execution and debug tracking

Rebuilding the ROM from source requires:
- A licensed copy of NESmaker
- The CC65 toolchain (ca65/ld65)
- Standard NES development tools

The NESmaker `.mod` and `.mst` project files (and corresponding backup variants) are included for completeness and transparency.
Opening or rebuilding the project requires a licensed copy of NESmaker, which is
a proprietary development environment.

The `.mod` file does not contain the NESmaker engine or proprietary binaries.
It represents the project state, assets, and configuration as used during development.

Screenshots of NESmaker project configuration are provided for documentation
and reproducibility purposes.

## 🛠 Build Requirements

To rebuild the ROM from source, you will need:

*  *CC65 toolchain* (ca65, ld65)
*  *NESmaker* (for project structure and asset integration)
*  *NES Screen Tool* (CHR/tile assets)
*  *FamiTracker* (audio)
*  A *standard NES emulator* for testing

Compilation requires a licensed copy of NESmaker.

## 📄 License

### Source Code
All original source code developed by the author (including CA65 assembly routines,

Game of Life kernel, traversal logic, and PPU update mechanisms) is released under the

MIT License.

### Assets and Documentation
Game manual, box art, cartridge label designs, and documentation are released under

Creative Commons Attribution–NonCommercial 4.0 (CC BY-NC 4.0), unless otherwise stated.

### Third-Party Tools
This project was developed using NESmaker, a proprietary development tool.

NESmaker itself is **not included** in this repository and remains subject to its own license.

Third-party assets are NOT covered by this license:
- Music by Shiru (used with permission / original homebrew tracks)
- Sound effects provided by NESmaker (used under NESmaker license)
- Nintendo trademarks are acknowledged and not claimed

See LICENSE file for details.

## 📚 Citation

*Pending for publication resource to become available*

## 👤 Authors 

*Pending for publication resource to become available*

## 🧭 Notes

+ Earlier experimental commits may not reflect the final publication behavior.

+ Issues and pull requests are welcome for educational extensions or verification.

+ Although NESMaker produces an autogenerated output files for the ROM, the authors preferred the current repository condition to ensure legilibility and verify consistency of the Scientific Contributions stated






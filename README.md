# Traffic Controller System (Verilog)

## Overview

This project implements a **Traffic Light Controller** using **Verilog HDL**. The system controls traffic lights for a **highway road** and a **city road** using a **Finite State Machine (FSM)** design. The controller changes the lights based on the clock signal and a vehicle detection input from the city road.

The system ensures safe traffic flow by coordinating **Red, Yellow, and Green signals** for both roads.

---

## Features

* Finite State Machine based traffic control
* Separate signal control for **Highway** and **City road**
* Vehicle detection input for city traffic
* Clock-driven state transitions
* Reset functionality to return to the default state

---

## Inputs

| Signal | Description                                 |
| ------ | ------------------------------------------- |
| `clk`  | Clock signal controlling state transitions  |
| `clr`  | Reset signal to initialize the controller   |
| `X`    | Vehicle detection sensor from the city road |

---

## Outputs

| Signal     | Description                  |
| ---------- | ---------------------------- |
| `hwy[1:0]` | Highway traffic light signal |
| `cty[1:0]` | City traffic light signal    |

Signal Encoding:

| Value | Meaning |
| ----- | ------- |
| `00`  | Red     |
| `01`  | Yellow  |
| `10`  | Green   |

---

## FSM States

The controller operates with **five states**:

| State | Highway Light | City Light | Description                    |
| ----- | ------------- | ---------- | ------------------------------ |
| `s0`  | Green         | Red        | Highway traffic flows normally |
| `s1`  | Yellow        | Red        | Highway prepares to stop       |
| `s2`  | Red           | Red        | Transition safety state        |
| `s3`  | Red           | Green      | City traffic allowed           |
| `s4`  | Red           | Yellow     | City prepares to stop          |

---

## State Transitions

* **s0 → s0** : No vehicle detected on city road (`X = 0`)
* **s0 → s1** : Vehicle detected (`X = 1`)
* **s1 → s2** : Highway yellow delay
* **s2 → s3** : Switch to city traffic
* **s3 → s0** : No vehicle waiting
* **s3 → s4** : Vehicle still detected
* **s4 → s0** : Return to highway green

---

## Default Initialization

At system start:

* `state = s0`
* `Highway = Green`
* `City = Red`

This allows uninterrupted highway traffic unless a city vehicle is detected.

---

## Design Methodology

The design uses a **Moore Finite State Machine**, where outputs depend only on the current state.

Three main blocks are implemented:

1. **State Register**

   * Updates the current state on every clock edge.

2. **Output Logic**

   * Determines traffic light signals based on the current state.

3. **Next-State Logic**

   * Determines the next state based on current state and input `X`.

---

## Applications

* Smart traffic signal systems
* Digital system design learning
* FPGA based traffic controllers
* Embedded traffic automation

---

## Requirements

* Verilog HDL simulator (ModelSim, Vivado, or Icarus Verilog)
* Basic knowledge of digital design and FSM

---


---


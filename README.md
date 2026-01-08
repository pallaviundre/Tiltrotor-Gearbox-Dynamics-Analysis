# Tiltrotor Gearbox Dynamics Analysis  
**AE233M – Introduction to Vibrations | IIT Kanpur**

## Overview
This project presents the dynamic and vibration analysis of a **tiltrotor gearbox system** incorporating **nonlinear damping** effects. The gearbox is modeled as a **three degree-of-freedom (3-DOF) torsional system**, and its response to step torque inputs is studied using both **nonlinear and linearized models**.

The work focuses on understanding the **limitations of linearization** and the impact of nonlinear damping on gearbox dynamics under high torque loading.

---

## Objectives
- Develop nonlinear equations of motion for a tiltrotor gearbox  
- Simulate time-domain response to step torque inputs  
- Linearize the system about an equilibrium operating point  
- Compare linear and nonlinear system responses  
- Perform transfer function and frequency-domain analysis  

---

## Repository Structure
├── AE233M_PROJECT.pdf               % Detailed project report

├── README.md

├── tiltrotor_gearbox_nonlinear.m    % Nonlinear gearbox dynamics simulation

├── tiltrotor_gearbox_linear.m       % Linearized system response

└── tiltrotor_transfer_function.m   % Poles, zeros & frequency analysis


---
Key Results:

-Linearized model accurately predicts response only for small torque perturbations

-Large torque inputs show significant deviation due to nonlinear damping

-Dominant complex poles govern vibration characteristics


---
Tools Used:
-MATLAB | ODE45 | State-space modeling | Linearization | Vibration analysis

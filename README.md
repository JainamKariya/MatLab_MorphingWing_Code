# ✈️ Morphing Wing Airfoil Generator (MATLAB)

![MATLAB](https://img.shields.io/badge/MATLAB-ff7f0e?style=for-the-badge&logo=mathworks)
![Aerodynamics](https://img.shields.io/badge/Aerodynamics-pink?style=for-the-badge)
![CFD](https://img.shields.io/badge/CFD-0a66c2?style=for-the-badge)
![UAV](https://img.shields.io/badge/UAV-2ea44f?style=for-the-badge)
![Morphing Wing](https://img.shields.io/badge/Morphing%20Wing-6f42c1?style=for-the-badge)
---

## 🚀 Overview

This project is a **parametric morphing airfoil generation tool** developed in MATLAB for **low-Reynolds-number UAV aerodynamic research**.

It enables controlled **trailing-edge camber morphing**, allowing designers to optimize lift-to-drag performance during:

* Loiter conditions
* Cruise efficiency
* Adaptive flight regimes

The generated airfoil coordinates are fully compatible with:

✔ XFLR5 / XFOIL
✔ CFD preprocessing
✔ SolidWorks CAD modeling

---

## ✨ Key Features

🔹 Parametric trailing-edge morphing mechanism
🔹 Cosine-spaced discretization for aerodynamic accuracy
🔹 Smooth camber deformation using pivot-based bending
🔹 Automatic export to `.dat` (XFOIL format)
🔹 CAD-ready XYZ coordinate export
🔹 Real-time airfoil visualization

---

## 🧠 Morphing Concept

The model simulates a **pivot-based camber morphing mechanism**:

* The leading section remains rigid
* Morphing begins at a specified chordwise pivot
* Camber increases smoothly toward the trailing edge

This closely represents **practical UAV morphing wing architectures**.

---

## 📐 Mathematical Model

### Thickness Distribution (NACA Formulation)

```
yt = 5t (0.2969√x − 0.1260x − 0.3516x² + 0.2843x³ − 0.1015x⁴)
```

---

### Camber Morphing Function

For x ≥ pivot:

```
yc = −m · ξ²
ξ = (x − pivot) / (1 − pivot)
```

This ensures:

✔ Smooth curvature transition
✔ Continuous slope at pivot
✔ No leading-edge distortion

---

## 📂 Project Structure

```
Morphing Wing MATLAB Model
│
├── Morphing_Cords_Generator.m   → Main airfoil generator
├── dat_File_Generator.m         → XFLR/XFOIL export
└── Text_File_Generator.m        → CAD coordinate export
```

---

## ⚙️ Workflow

### 1️⃣ Generate Morphing Airfoil

Run:

```
Morphing_Cords_Generator.m
```

This will:

* Generate geometry
* Plot the airfoil
* Store coordinates in workspace

---

### 2️⃣ Export for Aerodynamic Analysis

Run:

```
dat_File_Generator.m
```

Output:

* XFOIL/XFLR5 compatible `.dat` file

---

### 3️⃣ Export for CAD Modeling

Run:

```
Text_File_Generator.m
```

Output:

* SolidWorks-ready XYZ coordinate file

---

## 🎛 Adjustable Parameters

| Parameter | Description                     |
| --------- | ------------------------------- |
| **m**     | Morphing camber magnitude       |
| **pivot** | Morphing start location         |
| **t**     | Thickness ratio                 |
| **chord** | Airfoil chord length            |
| **n**     | Number of discretization points |

---


## 👨‍💻 Author

**Jainam Kariya**
Mechanical Engineering — Aerospace Focus

---

## 📜 License

Educational and research use only.

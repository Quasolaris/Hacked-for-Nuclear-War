```
-----------------------------------------------------------------
CYBER WARFARE DOCUMENTATION
-----------------------------------------------------------------
```

## 1. SYSTEM ARCHITECTURE OVERVIEW

The vessel is organized around a centralized command computer known as the **Submarine Command System (SCS)**. All major subsystems either report to or receive authorization from the SCS.

```
                ┌─────────────────────────┐
                │Submarine Command System │
                │         (SCS)           │
                └──────────┬──────────────┘
                           │
       ┌───────────────────┼───────────────────┐
       │                   │                   │
   NAVIGATION           WEAPONS              POWER
   & COMMUNICATION      CONTROL             MANAGEMENT
                          │                    │
                      SLBM SYSTEM           REACTOR

```

---

## 2. CYBER ATTACK ENTRY POINTS 

* Compromised removable data modules
* Corrupted maintenance diagnostics
* Contaminated update media
* Insider action during resupply or overhaul

Once introduced, malicious logic **does not immediately reveal itself**. Instead, it degrades system trust over time.

---

## 3. SYSTEM-WIDE IMPACT OF A SUCCESSFUL ATTACK

### 3.1 Command Core (SCS)

**Primary Effect:**
Loss of system authority and decision integrity.

**Observed Symptoms:**

* Inconsistent command acknowledgment
* Spurious fault warnings
* Delayed or missing system responses

**Operational Impact:**
The vessel effectively loses its ability to act as a coordinated platform. All other subsystems begin operating in isolation or fail-safe modes.

---

### 3.2 Navigation & Positioning

**Primary Effect:**
Data trust collapse.

**Observed Symptoms:**

* Position drift without external confirmation
* Conflicting depth and attitude readings
* Frozen or oscillating indicators

**Operational Impact:**

* Vessel cannot reliably determine location
* Maneuvering becomes hazardous
* Command decisions lose situational validity

---

### 3.3 Propulsion & Control

**Primary Effect:**
Command gating failure.

**Observed Symptoms:**

* Delayed throttle response
* Control surface hesitation
* Automatic limitation overrides

**Operational Impact:**

* Reduced manoeuvrability
* Inability to execute precise depth or course changes
* Emergency actions may be unavailable

---

### 3.4 Sensor Suite (Passive Systems)

**Primary Effect:**
Signal interpretation degradation.

**Observed Symptoms:**

* Contact classification errors
* Phantom detections
* Loss of signal correlation

**Operational Impact:**

* Crew cannot trust environmental awareness
* Tactical decision-making compromised
* Increased risk of collision or detection

---

### 3.5 Communications (Internal & External)

**Primary Effect:**
Synchronization failure.

**Observed Symptoms:**

* Garbled internal messages
* Delayed or dropped command relays
* External communication lockout
* False alarms or missing alerts

**Operational Impact:**

* Crew coordination breaks down
* External command authority cannot be verified
* Isolation increases stress and error rates

---

### 3.6 Power Management

**Primary Effect:**
Load distribution instability.

**Observed Symptoms:**

* Unexpected subsystem shutdowns
* Power spikes or brownouts
* Protective interlocks triggering without cause

**Operational Impact:**

* Cascading subsystem failures
* Increased likelihood of total system blackout

---

### 3.7 SLBM Platform

**Primary Effect:**
Launch sequence failure.

**Observed Symptoms:**

* Conflicting environmental readings
* Crash of launch sequence or simulation sequence
* Corrupt memory or storage readings

**Operational Impact:**

* Launch aborted or only partially commenced
* Flight computer not programmed correctly (faulty coordinates)
* Possible detonation of warheads inside SLBM-Tube

---

```
-----------------------------------------------------------------
END OF CYBER WARFARE INCIDENT DOCUMENTATION
-----------------------------------------------------------------
```

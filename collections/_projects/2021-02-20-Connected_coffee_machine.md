---
layout: project
title: "Connected Coffee Machine"
date: 2021-02-20T09:49:03Z
authors: ["elyoth_harian"]
categories: ["Project", "School", "Software", "Hardware"]
description: A connected coffee machine that allows you to control the coffee machine from your phone.
thumbnail: "/assets/images/gen/project/project-1-thumbnail.webp"
image: "/assets/images/gen/project/project-1-hero.webp"
comments: false

meta_title: Coffee Machine!
meta_description: A connected coffee machine that allows you to control the coffee machine from your phone.
meta_image: "/assets/images/og/og-twitter-blog-image.webp"
---

# K-Fee: The Connected Coffee Machine ☕️🤖

[![Project Demo](https://img.youtube.com/vi/3BPVyXFfyos/0.jpg)](https://www.youtube.com/watch?v=3BPVyXFfyos)

**A web-controlled coffee brewing system that combines IoT hardware with full-stack development**

🔗 [View on Hackster.io](https://www.hackster.io/389323/k-fee-the-connected-coffee-machine-7e0eeb)  
🔧 [GitHub Repository](https://github.com/Harian-Elyoth/Kfee)  

## Project Overview
We reengineered a standard coffee machine into a smart brewing system controllable via web interface. Users can:
- Customize sugar levels (1-5 cubes) 
- Select cup size (S/M/L)
- Create/save custom recipes
- Schedule automatic brewing
- Monitor ingredient levels in real-time

![Homepage](/assets/images/gen/project/content/content-1-homepage.webp)  
*Homepage of the connected coffee machine web interface*

## Technical Breakdown 🛠️

### Hardware Architecture
- **Brain**: Raspberry Pi 3B+ (MQTT broker/server) + ESP32 (sensor/motor control)
- **Sensing Suite**:
  - VL53L0X time-of-flight sensors (ingredient level monitoring)
  - Capacitive proximity sensor (cup detection)
  - Water level sensor
- **Actuation System**:
  - NEMA 14 stepper motors with custom 3D-printed augers
  - L298N motor drivers
  - Grove Relay for 230V kettle control
- **Safety**: Red LEGO-enclosed high voltage compartment

### Software Stack
- **Web Interface** (Python/Flask):
  - Recipe database (SQLite)
  - Scheduled brewing system
  - Real-time machine status dashboard
- **MQTT Communication** (Mosquitto):
  - Website ↔ Raspberry Pi ↔ ESP32
  - JSON payloads for brewing parameters
- **Firmware** (C++/Arduino):
  - Sensor data acquisition
  - Motor control algorithms
  - Safety interlocks

## Development Challenges 🧗
1. **High Voltage Handling**: Safely controlling 230V kettle with ESP32
2. **Material Flow**: Designing 3D-printed augers for consistent sugar/coffee dispensing
3. **Sensor Fusion**: Combining multiple sensing modalities for reliable operation
4. **Real-time Sync**: Ensuring <500ms latency between web request and machine start

## Lessons Learned 🎓
- **Team Collaboration**: Coordinating between 4 developers across hardware/software
- **Iterative Design**: 7 versions of 3D-printed augers to prevent ingredient clumping
- **Safety First**: Implementing multiple failsafes for high-voltage components
- **User Experience**: Balancing technical complexity with intuitive web interface

## Project Gallery 📸
![System Diagram](/assets/images/gen/project/content/content-1-system.webp)  
*Architecture overview showing MQTT communication flow*


## Team Insights 💡
>"Well the coffee wasn't that good, in fact there was too much sugar for not enough coffee, but it was a fun project to work on."

---

**Ready to brew?**  
👉 [Full tutorial on Hackster.io](https://www.hackster.io/389323/k-fee-the-connected-coffee-machine-7e0eeb)  
👨💻 [Explore the codebase](https://github.com/Harian-Elyoth/Kfee)
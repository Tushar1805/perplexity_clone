# Perplexity Clone 🔍

A Perplexity-style Q\&A app built with **Flutter** (frontend) and **FastAPI** (backend).

This project was created to sharpen skills in **Streams** & **WebSockets** — the frontend streams answers from the backend WebSocket and renders them live as Markdown.

---

## 📋 Table of contents

- [Perplexity Clone 🔍](#perplexity-clone-)
  - [📋 Table of contents](#-table-of-contents)
  - [Project overview](#project-overview)
  - [📂 Project structure](#-project-structure)
  - [🖥 Backend (FastAPI) — setup \& run](#-backend-fastapi--setup--run)
    - [Requirements](#requirements)
    - [Create \& activate virtualenv](#create--activate-virtualenv)
    - [Install dependencies](#install-dependencies)
    - [Run the server](#run-the-server)
  - [📱 Connecting mobile devices](#-connecting-mobile-devices)
    - [A. Physical Android device (USB)](#a-physical-android-device-usb)
    - [B. Android Emulator](#b-android-emulator)
    - [C. If `adb reverse` fails (alternative)](#c-if-adb-reverse-fails-alternative)
  - [🚀 Frontend (Flutter) — setup \& run](#-frontend-flutter--setup--run)
    - [1. Install dependencies](#1-install-dependencies)
    - [2. Generate localization (if your project uses it)](#2-generate-localization-if-your-project-uses-it)
    - [3. App icon setup (optional)](#3-app-icon-setup-optional)
    - [4. Splash screen setup (optional)](#4-splash-screen-setup-optional)
    - [5. Run the app](#5-run-the-app)
      - [Networking note](#networking-note)
  - [🧩 Environment / config example](#-environment--config-example)
  - [🛠 Troubleshooting tips](#-troubleshooting-tips)
  - [✨ Features](#-features)
  - [🎥 Demo](#-demo)
  - [🤝 Contributing](#-contributing)
  - [📬 Contact](#-contact)

---

## Project overview

This repository demonstrates a live Q\&A streaming flow: a Flutter client connects to a FastAPI backend over WebSockets and displays streaming text chunks as Markdown. The app is optimized for local development across Android, iOS, Web and Desktop using simple networking patterns for connecting emulators and physical devices.

## 📂 Project structure

```
perplexity_clone/
│
├── lib/                         # Flutter source code
│   ├── main.dart
│   ├── core/
│   ├── presentation/
│   └── services/
│
├── assets/
│   ├── images/
│   └── ...
│
├── server/                      # Backend (FastAPI)
│   ├── main.py                  # FastAPI app (contains http & ws endpoints)
│   ├── requirements.txt         # pip dependencies
│   ├── README.md                # backend-specific docs (optional)
│   └── venv/                    # virtualenv (should be in .gitignore)
│
├── pubspec.yaml                 # Flutter metadata & deps
├── README.md                    # This file
└── .gitignore
```

---

## 🖥 Backend (FastAPI) — setup & run

### Requirements

* Python 3.9+
* pip
* (recommended) virtualenv or `python -m venv`
* `adb` if you plan to connect a physical Android device via USB

### Create & activate virtualenv

```bash
cd server
python3 -m venv venv
```

**Windows (PowerShell)**

```powershell
# If PowerShell prevents script execution, run once as admin or for current user
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Activate venv
.\venv\Scripts\activate
```

**macOS / Linux**

```bash
source ./venv/bin/activate
```

> ⚠️ Make sure Python is installed and accessible from your PATH.

### Install dependencies

```bash
pip install -r requirements.txt
```

**Example `server/requirements.txt`**

```
fastapi
uvicorn[standard]
websockets
python-dotenv  # optional, if you use .env
```

(You can pin versions for reproducible environments.)

### Run the server

Recommended (explicit `uvicorn` command — binds to all interfaces so mobile devices can reach it):

```bash
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

If you prefer the FastAPI CLI and it's available:

```bash
fastapi dev main.py
```

**What to expect**

* HTTP API (example): `http://127.0.0.1:8000/chat`
* WebSocket: `ws://127.0.0.1:8000/ws/chat`

**Tip:** use `--host 0.0.0.0` when you want other devices on the LAN to access the server (e.g., `http://192.168.x.y:8000`).

## 📱 Connecting mobile devices

### A. Physical Android device (USB)

Use `adb reverse` to map device port → PC port so the device can use `localhost` on your PC.

```bash
adb devices                       # ensure device is connected & authorized
adb reverse tcp:8000 tcp:8000
```

Then in your Flutter app you can point to:

```
http://127.0.0.1:8000
ws://127.0.0.1:8000/ws/chat
```

If using `adb connect <DEVICE_IP>` (device over Wi‑Fi):

```bash
adb -s <device-ip-or-id> reverse tcp:8000 tcp:8000
```

### B. Android Emulator

* Android Emulator (AVD): use `10.0.2.2:8000` to reach your machine's localhost.
* Genymotion: use `10.0.3.2:8000`.

### C. If `adb reverse` fails (alternative)

Run the backend listening on `0.0.0.0`:

```
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

Find your PC’s LAN IP (e.g. `192.168.1.42`) and connect from the device to:

```
http://192.168.1.42:8000
ws://192.168.1.42:8000/ws/chat
```

Make sure firewall rules allow incoming connections on port `8000`.

---

## 🚀 Frontend (Flutter) — setup & run

### 1. Install dependencies

```bash
flutter pub get
```

### 2. Generate localization (if your project uses it)

```bash
flutter gen-l10n
```

### 3. App icon setup (optional)

Add the following to `pubspec.yaml`:

```yaml
flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/images/app_icon.png"
```

Then run:

```bash
flutter pub run flutter_launcher_icons
```

### 4. Splash screen setup (optional)

Add to `pubspec.yaml`:

```yaml
flutter_native_splash:
  color: "#51B848"
  image: assets/images/logo_large.png
  android: true
  ios: true
  fullscreen: true
```

Then run:

```bash
flutter pub run flutter_native_splash:create
```

### 5. Run the app

```bash
flutter run
```

#### Networking note

Use `http://10.0.2.2:8000` on AVD emulator, or `http://127.0.0.1:8000` if you used `adb reverse` with a physical device.
If you used your PC LAN IP, point the app to `http://<PC_IP>:8000` and `ws://<PC_IP>:8000/ws/chat`.

---

## 🧩 Environment / config example

If you want configurable endpoints, use a `.env` in `server/` or a constants file in Flutter.

**server/.env**

```
HOST=0.0.0.0
PORT=8000
```

**Flutter example**

```dart
// lib/core/constants.dart
const backendHost = 'http://10.0.2.2:8000';
const websocketUrl = 'ws://10.0.2.2:8000/ws/chat';
```

---

## 🛠 Troubleshooting tips

**`adb reverse` not working**

* Confirm `adb devices` shows your device and it is `device` (not `unauthorized`).
* Reconnect USB, accept the RSA prompt on the device.
* Use `adb -s <id> reverse ...` if multiple devices are attached.
* Alternative: host on `0.0.0.0` and use PC LAN IP.

**WebSocket connection refused**

* Ensure backend is running and listening on the port you expect.
* If using `127.0.0.1` on backend, mobile device may not reach it — use `adb reverse` or `0.0.0.0` + PC IP.
* Check firewall/antivirus blocking the port.

**CORS / security**

* WebSocket from Flutter mobile clients generally does not require CORS.
* For web builds, ensure your server adds appropriate CORS headers (e.g., using `fastapi.middleware.cors.CORSMiddleware`).

**Large streamed messages / chunking**

* If streaming text in chunks, ensure the client correctly appends chunks and updates UI on the main thread (use `setState` or state management callbacks).
* Consider a small `backpressure` or rate-limiting in the backend if your client cannot keep up.

**Slow scroll-to-bottom / UI not updating**

* Ensure you call scroll after the frame is rendered: `WidgetsBinding.instance.addPostFrameCallback`.
* Use `ListView` with `controller.jumpTo` or `animateTo` after new chunks arrive.

**Tokenization / encoding issues**

* Make sure you agree on encoding (usually UTF-8) and avoid sending binary chunks as text unless both sides expect it.

---

## ✨ Features

* Streaming answers from FastAPI WebSocket to Flutter via a `Stream`.
* Live Markdown rendering for richly formatted answers.
* Skeleton loaders while waiting for content.
* Clear separation between backend and frontend for local development.
* Designed to work on Web, Android, iOS and Desktop.

---

## 🎥 Demo

<https://github.com/user-attachments/assets/99620d27-2954-44d1-965f-57deca9a1c83>

## 🤝 Contributing

1. Fork the repo.
2. Create a feature branch: `git checkout -b feat/your-feature`.
3. Commit and push: `git commit -am "Add feature" && git push origin feat/your-feature`.
4. Open a Pull Request with a clear description and testing steps.

Open issues for bugs or feature requests and keep backend/frontend changes split with documented env variables.

---

## 📬 Contact

If you want help setting this up, want features added, or want to collaborate:

* Email: [tushkwork@gmail.com](mailto:tushkwork@gmail.com)
* Mobile: 9673072109


*Happy hacking — stream safely and render beautifully!*

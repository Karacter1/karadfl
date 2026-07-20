# Local setup

This document describes the local setup needed to run the project on your desktop machine and quickly test it from a terminal.

## 1. Expected requirements

### Minimum requirements
- Windows 10/11 desktop or laptop
- Python 3.10 or 3.11 recommended
- Git for Windows
- A working webcam or camera device
- A display connected to the machine
- At least 8 GB RAM, preferably 16 GB+

### Recommended for better performance
- NVIDIA GPU with recent drivers
- 16 GB+ system RAM
- SSD storage

## 2. Install the base tools

### Install Python
- Download Python 3.11 from python.org.
- During installation, select Add Python to PATH.
- Verify it installed correctly:

```powershell
py --version
```

### Install Git for Windows
- Download and install Git for Windows from git-scm.com.
- Verify:

```powershell
git --version
```

## 3. Clone the repository

```powershell
git clone https://github.com/Karacter1/karadfl.git
cd karadfl/deep-live-cam-lite
```

## 4. Create a virtual environment

```powershell
py -3.11 -m venv venv
venv\Scripts\activate
```

If PowerShell blocks activation, run:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

## 5. Install Python dependencies

```powershell
pip install --upgrade pip
pip install -r requirements.txt
```

## 6. Place the required models

Place these files inside the models folder:

- GFPGANv1.4.onnx
- inswapper_128_fp16.onnx

Example:

```powershell
mkdir models
```

Then copy the downloaded files into:

```powershell
karadfl\deep-live-cam-lite\models
```

## 7. Quick smoke test from the terminal

Run the CLI help to confirm the entrypoint is working:

```powershell
python run.py --help
```

If that works, the project entrypoint is ready.

## 8. Start the app

```powershell
python run.py
```

## 9. What to expect

### Localhost URL / endpoint

This project is primarily a desktop GUI / local processing app. In this environment, it does not appear to expose a standard browser-facing localhost web endpoint by default. The usual test path is:

- launch the app locally in the terminal or GUI
- use the desktop interface directly
- if you are using OBS, route your camera or stream through OBS as needed

### If you want a browser-like testing workflow

Use one of the following:

1. Run the app locally on the desktop and test directly.
2. If you need remote access from another machine, use a remote desktop tool such as RustDesk, AnyDesk, or Chrome Remote Desktop.
3. If you specifically want a web-based UI, this project may need an additional wrapper or a different entrypoint than the default desktop launcher.

## 10. OBS setup checklist

For the most reliable testing path:

1. Install OBS Studio on the same desktop PC.
2. Start OBS.
3. Add a camera or display source.
4. Enable Virtual Camera if you want OBS to act as a camera source.
5. Launch the app and test with the OBS feed.

## Notes

If the project fails to start, review the troubleshooting guide and confirm that the model files are present under the models folder.

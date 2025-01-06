@echo off
echo Starting Automatic1111 Stable Diffusion WebUI CPU-only installation...

:: --- Step 1: Check Python ---
echo Checking Python installation...
where python > nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed or not in your PATH. Please install it and try again.
    pause
    exit /b 1
)
echo Python found.

:: --- Step 2: Clone the WebUI Repository ---
echo Cloning the Stable Diffusion WebUI repository...
if not exist stable-diffusion-webui (
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
    if %errorlevel% neq 0 (
        echo Error cloning the repository. Please check your internet connection and git installation.
        pause
        exit /b 1
    )
) else (
   echo Repository already exists. Skipping clone.
)
echo Repository cloned successfully.

:: --- Step 3: Navigate to the WebUI Directory ---
cd stable-diffusion-webui

:: --- Step 4: Create and Activate Virtual Environment (Optional, but recommended) ---
echo Creating virtual environment...
if not exist venv (
    python -m venv venv
    if %errorlevel% neq 0 (
        echo Error creating virtual environment. Please check your python install and venv module.
        pause
        exit /b 1
    )
)
echo Virtual environment created.
echo Activating virtual environment...
call venv\Scripts\activate
if %errorlevel% neq 0 (
    echo Error activating the virtual environment. Please make sure that you are running this script from inside of a non-protected folder
    pause
    exit /b 1
)
echo Virtual environment activated.

:: --- Step 5: Install Required Packages (CPU-Only) ---
echo Installing required packages...
pip install --upgrade pip
pip install torch==2.2.2+cpu torchvision==0.17.0+cpu --index-url https://download.pytorch.org/whl/cpu

:: Install other common requirements.
pip install -r requirements_versions.txt
pip install -r requirements.txt

:: Install specific requirements, skipping GPU-related ones.
pip install -U numpy
pip install -U psutil
pip install -U opencv-python
pip install -U Pillow

echo Done installing required packages.

:: --- Step 6: Update some of the files to make it cpu only
echo Editing `webui-user.bat` to force CPU...
echo @echo off > webui-user.bat
echo set COMMANDLINE_ARGS= --use-cpu all  --skip-torch-cuda-test --no-half --precision full >> webui-user.bat
echo call webui.bat >> webui-user.bat

:: --- Step 7: Installation Complete ---
echo.
echo =============================================
echo Installation completed successfully!
echo.
echo To run the webui, execute `webui-user.bat` located in: `%cd%`
echo =============================================
pause
exit /b 0
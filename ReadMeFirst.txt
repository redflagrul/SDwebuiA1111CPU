Install MiniConda 

https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe

Install Visual C++ 

https://github.com/abbodi1406/vcredist/releases/tag/v0.85.0

Create a Folder Called SDCPU

Place SDCPUWEBUI.bat in folder

RUN IT
Close Command Prompt Go to CivitAI Download Model Place in Model Folder

Reopen MiniConda Prompt

webui.bat --no-download-sd-model --no-hashing --theme dark --disable-model-loading-ram-optimization --disable-nan-check --disable-opt-split-attention --lowram --lowvram --no-half --skip-torch-cuda-test



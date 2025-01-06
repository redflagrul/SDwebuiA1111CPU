Install MiniConda 

https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe

Install Visual C++ 

https://github.com/abbodi1406/vcredist/releases/tag/v0.85.0

Install Git

https://github.com/git-for-windows/git/releases/download/v2.47.1.windows.1/Git-2.47.1-64-bit.exe

Create a Folder Called SDCPU
Create conda environment

conda create -n sdcpu python=3.10.6
conda activate sdcpu

Place SDCPUWEBUI.bat in folder

RUN IT
Close Command Prompt Go to CivitAI Download Model Place in Model Folder
https://civitai.com/api/download/models/501286?type=Model&format=SafeTensor&size=pruned&fp=fp16

Reopen MiniConda Prompt

webui.bat --no-download-sd-model --no-hashing --theme dark --disable-model-loading-ram-optimization --disable-nan-check --disable-opt-split-attention --lowram --lowvram --no-half --skip-torch-cuda-test



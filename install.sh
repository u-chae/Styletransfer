#!/bin/bash

# [1] Conda 환경 만들기
conda create -n styletransfer python=3.8 -y
source $(conda info --base)/etc/profile.d/conda.sh
conda activate styletransfer

# [2] 기본 라이브러리 설치
conda install --yes -c pytorch pytorch=1.7.1 torchvision cudatoolkit=<CUDA_VERSION>
pip install ftfy regex tqdm gdown
pip install git+https://github.com/openai/CLIP.git

# [3] 추가 코드 및 모델 다운로드
mkdir -p /content
git clone https://github.com/omertov/encoder4editing.git /content/encoder4editing
wget https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip
unzip ninja-linux.zip -d /usr/local/bin/
update-alternatives --install /usr/bin/ninja ninja /usr/local/bin/ninja 1 --force

wget -O /content/shape_predictor_68_face_landmarks.dat.bz2 http://dlib.net/files/shape_predictor_68_face_landmarks.dat.bz2
cd /content && bzip2 -dk shape_predictor_68_face_landmarks.dat.bz2

echo > /content/encoder4editing/__init__.py
sed -i 's/img = PIL.Image.open(filepath)/img = PIL.Image.open(filepath).convert("RGB")/' /content/encoder4editing/utils/alignment.py

echo "✅ Setup complete!"

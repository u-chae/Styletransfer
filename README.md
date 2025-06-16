# StyleTransfer

This project performs style-based image editing using CLIP and e4e encoder.

## 💻 Setup

1. Clone the repository:

```bash
git clone https://github.com/u-chae/Styletransfer.git
cd Styletransfer
```
2. Run the setup script

```bash
bash install.sh
```
3. Download pretrained models

We provide various auxiliary models needed for the PTI inversion task.  
These include the StyleGAN generator and pre-trained models used for loss computation and image alignment.

| Model             | Description                             | Download |
|------------------|-----------------------------------------|----------|
| FFHQ StyleGAN    | StyleGAN2-ADA model (1024x1024)         | [📥 ffhq.pkl](https://nvlabs-fi-cdn.nvidia.com/stylegan2-ada-pytorch/pretrained/ffhq.pkl) |
| Dlib Alignment   | Dlib face landmarks model               | [📥 shape_predictor_68_face_landmarks.dat.bz2](https://drive.google.com/file/d/1HKmjg6iXsWr4aFPuU0gBXPGR83wqMzq7/view)
| FFHQ e4e Encoder | Pretrained e4e encoder                  | [📥 e4e_ffhq_encode.pt](https://drive.google.com/file/d/1ALC5CLA89Ouw40TwvxcwebhzWXM5YSCm/view)
| Toon StyleGAN    | StyleGAN model trained on cartoon-style data      | [📥 ffhq-cartoon-blended-64.pkl](https://drive.google.com/uc?id=1H73TfV5gQ9ot7slSed_l-lim9X7pMRiU/view")

After downloading, place these files in the appropriate directories as referenced by the code  
(e.g., `encoder/`, `pretrained_models/`, or `/content` depending on your implementation).

## 💻 Inference

### 🚀 Run Image Editing

You can run the editing script with your own image by using the following command:

```bash
cd emotiona_aware

python edit_image.py \
  --input /path/to/input_image.jpg \
  --output /path/to/output_image.jpg 
```

### 📁 Preparing Image to Latent

To invert and edit a generated image, it must first be **aligned and cropped** to the correct size.  
You can perform this preprocessing by using one of the following options:

- Run the notebook: `notebooks/align_data.ipynb`  
  → Modify the `images_path` variable to point to your raw image directory

- Run the script: `utils/align_data.py`  
  → Modify the `images_path` variable to point to your raw image directory

---


#!/bin/bash

# Check inputs
split_and_assign() {
  local input=$1
  local key=$(echo $input | cut -d'=' -f1)
  local value=$(echo $input | cut -d'=' -f2-)
  eval $key=$value
}

# Split the input string into individual components
for ((i=1; i<=$#; i++)); do
    split_and_assign "${!i}"
done

# Inputs 
# video=/path/to/your/video.MOV

# Create folder structure
output_folder="calibration_output"
images_folder="${output_folder}/cam0"
output_bag="${output_folder}/calibration.bag"
mkdir -p ${output_folder}
mkdir -p ${images_folder}

# Run calibration steps
source devel/setup.bash
python scripts/vid2imgs.py --video ${video} --output ${images_folder}
rosrun kalibr kalibr_bagcreater --folder ${output_folder} --output-bag ${output_bag}
rosrun kalibr kalibr_calibrate_cameras --target src/kalibr/april_6x10.yaml --models pinhole-radtan --topics /cam0/image_raw  --bag ${output_bag}  --bag-freq 24.0 --verbose

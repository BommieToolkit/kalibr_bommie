```bash
pixi run git-clone
pixi run build 
rosrun kalibr kalibr_create_target_pdf --type apriltag --nx 10 --ny 6

pixi run kalibr-calibrate-stereo-rig  video_left=/home/alejandro/kalibr_bommie/left.MP4 video_right=/home/alejandro/kalibr_bommie/right.MP4

python match_images_by_ns.py /home/alejandro/kalibr_bommie/calibration_output/cam0 /home/alejandro/kalibr_bommie/calibration_output/cam1 /home/alejandro/colmap_bommie/reconstruction_output/images/rig1/camera1 /home/alejandro/colmap_bommie/reconstruction_output/images/rig1/camera2 --threshold-ns 5000000

```
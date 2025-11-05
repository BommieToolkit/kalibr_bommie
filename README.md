```bash
pixi run git-clone
pixi run build 
rosrun kalibr kalibr_create_target_pdf --type apriltag --nx 10 --ny 6
pixi run kalibr_calibrate  video:/home/alejandro/Downloads/IMG_3782.MOV
```
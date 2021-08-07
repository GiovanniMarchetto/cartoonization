# Cartoonization
University project for the cartoonization of an image

## Description
The first goal was to create a function to render images with the cartoon type.

The second goal was to look for a way to do cartoonization without using the gradient, since there was already a similar function.

## Files

- _medianCartoon_, operates a median filtering
- _bilaterImgFilter_, operates a bilinear filtering

- _thrCartoon_, operates a cartoonization through thresholds/intevals
- _clusterCartoon_, operates a cartoonization through the division into clusters
- _minDensityImgFilter_, operates a cartoonization through the elimination of the less present color
- _densityCartoon_, operates a cartoonization exploiting both the intervals and the density of a certain color in an area

- _addEdge_, to add a border to an image
- _edgeCorrection_, corrects the contours in case the images have been processed as rgb (and not lab)
- _edgeCorrectionMultiple_, corrects the contours in case the images have been processed as rgb (and not lab)

- **cartoon2**, operates a cartoonization exploiting the bilateral filtering and the method of the thresholds/intervals (Lab mode)
- **cartoon3**, operates a cartoonization exploiting the bilateral filtering and the method of the clusters (Lab mode)


- _main_, comparison between a cartoon image made with the command already present and the two cartoon methods exposed
- _someTries_, various combinations of the exposed methods

## Results
The goals were partially met. In fact, the outlines set forth are not satisfactory. The colors of the final image, on the other hand, are mostly acceptable.

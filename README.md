# COMET
Mapping multimodal associations between (functional) COnnectivity - (cerebral glucose) METabolism

-------------------------------------------------------------------------------------------------

COMET.m is a MATLAB script for calculating rPWR and rCST as defined in the following paper:
Shokri-Kojori, E., Tomasi, D., Alipanahi, B. et al. Correspondence between cerebral glucose metabolism and BOLD reveals relative power and cost in human brain. Nat Commun 10, 690 (2019). https://doi.org/10.1038/s41467-019-08546-x

It requires two 4D maps (e.g., PET-based metabolic maps for all participants and the correponding fMRI-based activity maps) and one 3D map (for masking the data). You may alter the script to accommodate your data. Please note that the following (free) toolbox is required for reading the NIFTI maps (which should be downloaded and present in the same director as 'COMET.m'):
https://www.mathworks.com/matlabcentral/fileexchange/8797-tools-for-nifti-and-analyze-image

-------------------------------------------------------------------------------------------------

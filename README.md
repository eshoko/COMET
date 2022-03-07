# COMET
Mapping multimodal associations between (functional) COnnectivity - (cerebral glucose) METabolism as described in the following paper:

Shokri-Kojori, E., Tomasi, D., Alipanahi, B. et al. Correspondence between cerebral glucose metabolism and BOLD reveals relative power and cost in human brain. Nat Commun 10, 690 (2019). https://doi.org/10.1038/s41467-019-08546-x

-------------------------------------------------------------------------------------------------

COMET.m is a MATLAB script for calculating rPWR and rCST. It requires two 4D maps (e.g., PET-based metabolic maps for all participants and the corresponding fMRI-based activity maps) and one 3D map (for masking the data). You may alter the script to accommodate your data. Please note that the following (free) toolbox is required for reading the NIFTI maps (which should be downloaded and present in the same director as 'COMET.m'):
https://www.mathworks.com/matlabcentral/fileexchange/8797-tools-for-nifti-and-analyze-image

-------------------------------------------------------------------------------------------------

Other files are the average maps across the 28 healthy participants (cohort 1) for different indices reported in the paper:

ave_CMRglc.nii.gz is the average of CMRglc maps.
ave_log-lFCD.nii.gz is the average of log-lFCD maps.
ave_rCST.nii.gz is the average of rCST maps.
ave_rPWR.nii.gz is the average of rPWR maps.

-------------------------------------------------------------------------------------------------

% This MATLAB code calculates relative Power (rPWR) and relative Cost (rCST) indices as described in:
% Shokri-Kojori, E., Tomasi, D., Alipanahi, B. et al. Correspondence between cerebral glucose 
% metabolism and BOLD reveals relative power and cost in human brain. Nat Commun 10, 690 (2019). 
% https://doi.org/10.1038/s41467-019-08546-x
%
% Written by Ehsan Shokri Kojori, PhD (ehsan.shokrikojori@nih.gov)


% For reading and saving NIfTI images, please download "Tools for NIfTI and ANALYZE image" toolbox here: 
% https://www.mathworks.com/matlabcentral/fileexchange/8797-tools-for-nifti-and-analyze-image

addpath(fullfile(pwd, 'NIfTI_20140122')); % adjust this line if needed

lcl = load_nii('LCL.nii.gz'); % this 4D file contains the activity maps (e.g., lFCD or REHO). The 4th dimension is participant.
pet = load_nii('FDG.nii.gz'); % this 4D file contains the metabolic maps (e.g., FDG SUVr). The 4th dimension is participant.
msk = load_nii('mask.nii.gz'); % this file contains a single generic mask (e.g., whole brain mask or a gray matter mask)

msk = msk.img; % extracting the mask matrix

for i = 1:size(lcl.img, 4) % looping through participants

    lcl_tmp = lcl.img(:, :, :, i); % extracting the subject's activity matrix
    pet_tmp = pet.img(:, :, :, i); % extracting the subject's metabolic matrix
   
    cst_tmp = zeros(size(lcl.img(:, :, :, i))); % initializing rCST
    pwr_tmp = cst_tmp; % initializing rPWR
   
    nonzerovox = find(lcl_tmp.*pet_tmp.*msk); % identifying nonzero voxels, you may remove 'lcl_tmp.*pet_tmp' in case negative values are acceptable in these matrices
   
    [b_t, b_r] = cart2pol(zscore(lcl_tmp(nonzerovox)), zscore(pet_tmp(nonzerovox))); % conversion to polar coordinates
   
    pwr_tmp(nonzerovox) = b_r.*(sin(b_t+pi/4)); % calculating rPWR
    cst_tmp(nonzerovox) = b_r.*(sin(b_t-pi/4)); % calculating rCST
   
    lcl.img(:, :, :, i) = pwr_tmp;
    pet.img(:, :, :, i) = cst_tmp;
   
end

save_nii(lcl, 'rPWR.nii.gz'); % saving the rPWR output in the present directory
save_nii(pet, 'rCST.nii.gz'); % saving the rCST output in the present directory

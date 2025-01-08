%% Load demo Wine Data

load nmr.mat
%% Plot raw data
% the region between 1.25 and 1.45 ppm contains the succinic acid signal

plot (ppm, data');
set(gca,'XDir','reverse');

%% Plot the lactic acid zoomed region (all ppm)

plot (ppm(1:65532), data(:,1:65532));
axis tight
set(gca,'XDir','reverse');

%% iCOshift 1: aligns the whole spectra according to a reference signal selected (Ethanol CH3 resonance)
% Try to zoom on one subplot to view more features. Turn off the zoom
% button and try to click on one spectrum or on one interval to see more details.

[AlignedWineData, intervals, indexes] = icoshift ('average', data, (1:65532), 'f',[2 1 0]);

%% iCOshift 2: splits the dataset in 50 regular intervals and aligns each of them separately
% COMMAND: [xCS,ints,ind] = icoshift(xT,xP,inter,{n},{options})
% [AlignedWineData, intervals, indexes] = icoshift (target sample, Dataset, intervals mode definition, allowed shift mode , plot options);

[AlignedWineData, intervals, indexes] = icoshift ('average', data, 50, 'f', [2 1 0]);

%% iCOshift 3: splits the dataset in regular intervals 800 points wide and search for the "best" allowed shift for each of them separately

[AlignedWineData, intervals, indexes] = icoshift ('average', data, '800', 'b', [2 1 0]);


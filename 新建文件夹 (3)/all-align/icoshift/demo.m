%% Load demo Data

load matlab.mat
%% Plot raw data
% the region between A and B ppm contains the succinic acid signal

plot (ppm, data);
set(gca,'XDir','reverse');

%% Plot the lactic acid zoomed region (A - B ppm)

plot (ppm(1:65532), data(:,1:65532));
axis tight
set(gca,'XDir','reverse');

%% iCOshift 1: aligns the whole spectra according to a reference signal selected (Ethanol CH3 resonance)
% Try to zoom on one subplot to view more features. Turn off the zoom
% button and try to click on one spectrum or on one interval to see more details.

[Alignedplasma, intervals, indexes] = icoshift ('average', data, (1:65532), 'f',[2 1 0]);

%% iCOshift 2: splits the dataset in 50 regular intervals and aligns each of them separately
% COMMAND: [xCS,ints,ind] = icoshift(xT,xP,inter,{n},{options})
% [AlignedWineData, intervals, indexes] = icoshift (target sample, Dataset, intervals mode definition, allowed shift mode , plot options);

[Alignedplasma, intervals, indexes] = icoshift ('average', data, 50, 'f', [2 1 0]);

%% iCOshift 3: splits the dataset in regular intervals 800 points wide and search for the "best" allowed shift for each of them separately

[Alignedplasma, intervals, indexes] = icoshift ('average', data, '800', 'b', [2 1 0]);

%% iCOshift 4: splits the dataset in pre-defined intervals (on the basis of the user's knowledge) and aligns each of them
% The vector used for defining the intervals is compatible with the
% iToolbox's algorithms (e.g. iPLS and iPCA)
 
[Alignedplasma, intervals, indexes] = icoshift ('average', data, wine_ints, 'f', [2 1 0]);

%% iCOshift 4a: Like the previous example but using an intermediate "coshift" step

[Alignedplasma, intervals, indexes] = icoshift ('max', data, wine_ints, 'f', [2 1 1]);
set(gca,'Xlim',[1 65532], 'Ylim', [-100 9e06]);


%% iCOshift 4b: Like the previous example but using missing values for the last setp

[Alignedplasma, intervals, indexes] = icoshift ('max', data, wine_ints, 'f', [2 0 1]);
set(gca,'Xlim',[1 65532], 'Ylim', [-100 9e06]);

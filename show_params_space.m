basedir = 'imagestestHough'
thetas = linspace(-pi/2, pi/2-0.01,200);
rho_resolution = 1;

fnames = dir(basedir);
for i=1:length(fnames)
    if fnames(i).isdir
        continue
    end
    I = imread(fullfile(basedir, fnames(i).name));
    if length(size(I)) == 3
        I = rgb2gray(I);
    end
    A = hough_line(I, thetas, rho_resolution);

    figure()

    subplot(1,2,1);
    imagesc(I);
    colormap(gray(256))
    axis 'image';    

    subplot(1,2,2);
    imagesc(A);
    colormap(gray(256))

   out_fname = fullfile(basedir, strcat('result_',fnames(i).name,'.png'));
   print('-painters', '-dpng', out_fname);

end


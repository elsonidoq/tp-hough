basedir = 'imagestestHough'
thetas = linspace(-pi/2, pi/2-0.01,200);
rho_resolution = 1;

fnames = dir(basedir);
for i=1:length(fnames)
    if fnames(i).isdir
        continue
    end
    try
        I = imread(fullfile(basedir, fnames(i).name));
    catch
        continue
    end
    if length(size(I)) == 3
        I = rgb2gray(I);
    end
    [A rhos] = hough_line(I, thetas, rho_resolution);

    figure()

    subplot(1,2,1);
    imagesc(I);
    colormap(gray(256))
    axis 'image';    

    subplot(1,2,2);
    imagesc(A);
    colormap(gray(256))

    ylabel('\rho')
    step = floor(length(rhos)/10);
    yticks = 1:step:length(rhos);
    set(gca, 'YTick', yticks, 'YTickLabel', rhos(yticks))

    xlabel('\theta')
    step = floor(length(thetas)/10);
    xticks = 1:step:length(thetas);
    set(gca, 'XTick', xticks, 'XTickLabel', round(thetas(xticks)*100)/100)

    set(gcf, 'PaperPosition', [1   2   18   4]);

   out_fname = fullfile(basedir, strcat('result_',fnames(i).name,'.png'));
   print('-painters', '-dpng', out_fname);

end


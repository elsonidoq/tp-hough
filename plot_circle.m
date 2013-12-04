function I = plot_circle(I, xm, ym, r)
   x = -r;
   y = 0;
   err = 2-2*r;
   while x < 0
      I = set_pixel(I, xm-x, ym+y, 255);
      I = set_pixel(I, xm-y, ym-x, 255);
      I = set_pixel(I, xm+x, ym-y, 255);
      I = set_pixel(I, xm+y, ym+x, 255);
      r = err;
      if r <= y 
          y = y + 1;
          err = err +  y*2+1;
        end
      if r > x || err > y
           x = x + 1;
           err = err + x*2+1; %/* e_xy+e_x > 0 or no 2nd y-step */
      end
   end

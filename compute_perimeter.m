function p = compute_perimeter(r)
   x = -r;
   y = 0;
   err = 2-2*r;
   p = 0;
   while x < 0
      p = p + 4;
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


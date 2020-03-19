% 
% fileID = fopen('magic4.bin','w');
% fwrite(fileID,magic(4),'double');
% fclose(fileID);

function ret = write__Binary(filename, complex_vector)

  %% usage: write_complex_binary (filename, complex_vector)
  %%
  %%  open filename and write the contents of a complex column vector 
  %%  32 bit complex number
  %%

  m = nargchk (2,2,nargin);
  if (m)
    usage (m);
  end

  f = fopen (filename, 'w','l');
  
  if (f < 0)
    ret = -1;
  else
    I = real(complex_vector);
    Q = imag(complex_vector);
    [m,n] = size(complex_vector);
    totElem = m*n;
    
    newI = reshape(I,totElem,1);
    newQ = reshape(Q,totElem,1);
    
    fwrite (f, [newI newQ].', 'double');
    ret = fclose (f);
  end
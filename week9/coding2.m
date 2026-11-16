idx1 = find(fx<0);
res1=x(idx1(1)-1);

tmpx=x(idx1(1):end);
tmpfx=fx(idx1(1):length(fx));

idx2=find(tmpfx>=0);
res2=tmpx(idx2(1));

['res1: ' num2str(res1) '/res:' num2str(res2)]

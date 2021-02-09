function weight_map = update_weight_map_ALM(prior_weight_map,y_r,y_gt,lamda_y,lamda_w_scal,bdbox_ratio)

update_w = 0;
y_r = normalizing(fftshift(y_r),0,1);
y_gt = fftshift(y_gt);
y = y_r(:);
y_s = y_gt(:);

weights =  prior_weight_map(:);
mu = sum(weights);

dy2 = abs(y-y_s);
S = sum(dy2 .* weights) * lamda_y;
Lk = lamda_y * dy2 ;
deta = weights./(2 * mu) .*(abs(weights .* (S - Lk))).^(-1);
lamda_w = 1 ./ (lamda_w_scal * deta);

if  min(lamda_w) > 0 || update_w == 1
    dw = 1./(2 * lamda_w * mu) .* weights .* (S - Lk);
    new_weights = weights + dw;   
    new_weights(new_weights<0) = 0;
    weight_map = reshape(new_weights,size(prior_weight_map));
else
    weight_map = prior_weight_map;
end

end


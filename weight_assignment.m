
% Assign the weights to the training samples for CF tracking 

if frame > 1             
    if params.den_per_channel
        hf = hf_num ./ (hf_den + params.lambda);
    else
        hf = bsxfun(@rdivide, hf_num, sum(hf_den, 3)+params.lambda);
    end
    % response in Fourier Domain
    response_cf = ensure_real(ifft2(sum(conj(hf) .* xtf, 3)));      
    % response in the spatial domain
    response_w = response_cf;
    sz_w = size(weight_map);   
    % Update the weight map using ALM algorithm
    if params.useUpdateW == 1
        weight_map = update_weight_map_ALM(prior_weight_map,y_w,y,lamda_y,lamda_w,target_sz./bg_area);                               
    end
    % weight_map in Fourier Domain
    weight_map = fftshift(weight_map);
    weight_map = normalizing(weight_map,w_max*1/lamda_y,1/lamda_y);
    % Assign the weights to the training sample susing the weight map
    y_w = (response_w + lamda_y * (weight_map) .* y)./(ones(sz_w) + lamda_y * (weight_map));
    %   FFT of y_w.
    yf  = fft2(y_w); 
end

# DSAR-CF
Public code of DSAR-CF (Dynamic Saliency-Aware Regularization for Correlation Filter based Object Tracking), published in TIP 2019.
```
@article{han2020fast,
  title={Fast Learning of Spatially Regularized and Content Aware Correlation Filter for Visual Tracking}, 
  author={Han, Ruize and Feng, Wei and and Wang, Song},  
  year={2020},  
  journal={IEEE Transactions on Image Processing}
}
```

## Method

![example](https://github.com/HanRuize/DSAR-CF/blob/master/figs/example.png)

With a good balance between accuracy and speed, correlation filter (CF) has become a popular and dominant visual object tracking scheme. It implicitly extends the training samples by circular shifts of a given target patch, which serve as negative samples for fast online learning of the filters. Since all these shifted patches are not real negative samples of the target, CF tracking scheme suffers from the annoying boundary effects that can greatly harm the tracking performance, especially under challenging situations, like occlusion and fast temporal variation. Spatial regularization is known as a potent way to alleviate such boundary effects, but with the cost of highly increased time complexity, caused by complex optimization imported by spatial regularization. In this paper, we propose a new fast learning approach to content-aware spatial regularization, namely weighted sample based CF tracking (WSCF). 
In WSCF, specifically, we present a simple yet effective energy function that implicitly weighs different training samples by spatial deviations. With the energy function, the learning of correlation filters is composed of two subproblems with closed-form solution and can be efficiently solved in an alternate way.
We further develop a content-aware updating strategy to dynamically refine the weight distribution to well adapt to the temporal variations of the target and background. Finally, the proposed WSCF is used to enhance two state-of-the-art CF trackers to significantly boost their tracking accuracy, with little sacrifice on the tracking speed. Extensive experiments on \revised{five} benchmarks validate the effectiveness of the proposed approach.

## Experiments
The experimental results on OTB-2013/2015: (We put the raw results in results_DSAR-CF_OTB15.zip)  

![res](https://github.com/HanRuize/DSAR-CF/blob/master/figs/res.png)

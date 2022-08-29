#!/usr/bin/env python
# coding: utf-8

# In[1]:


"""
instruction: run with bokeh
bokeh serve --show dva_exc2_skeleton.py
"""

import numpy as np
from numpy.random import rand
from PIL import Image
from bokeh.plotting import figure, curdoc, show
from bokeh.layouts import column, row
from bokeh.models.widgets import Slider, Select
from bokeh.models import ColumnDataSource
from scipy.ndimage import gaussian_filter, median_filter




imgnames = ['panda.jpg', 'panda2.jpg']
# create Select widget for image selection
select_image = Select(title="Image:", value="panda.jpg", options=["panda.jpg", "panda2.jpg"])

# create imageselect function and update_image function
# construct size source and original image source for updating information when change image
# construct image data source for display
# construct noise data source to exchange data between updating functions
def imageselect(imagename):
    for i in np.arange(2): # change the number here if more than 2 images are included in the "options"
        if imagename in imgnames[i]:
            data_img = Image.open(imgnames[i]).convert('RGBA')
            xdim, ydim = data_img.size
            original = np.flipud(np.asarray(data_img))

            # constructing columndatasource for further processing
            sizesource = ColumnDataSource(data={'size': [xdim, ydim]})
            originalsource = ColumnDataSource(data={'image': [original]})
            imgsource = ColumnDataSource(data={'image': [original]})
            noisesource = ColumnDataSource(data={'image': [original]})
    return sizesource, originalsource, imgsource, noisesource

sizesource, originalsource, imgsource, noisesource = imageselect(select_image.value)


# when selecting different images, update function will be called and all image information should be updated
def update_image(attrname, old, new):
    print('update_image(%s)' % new)
    size, origin, image, noise = imageselect(select_image.value)
    sizesource.data.update(size.data)
    originalsource.data.update(origin.data)
    imgsource.data.update(image.data)
    noisesource.data.update(noise.data)

# trigger function for image selection    
select_image.on_change('value', update_image) 



# ===============================================================
# ========== Task1: create image processing functions ===========
# ===============================================================

# task1.1: create salt and pepper noise function
# hint1: the noise will be added to the original image, i.e. originalsource
# hint2: the noise image should be passed to both noise source and image source
# hint3: the noise source will be used in the filter functions as input, the image source will be used only for display
def salt_pepper(noise_density):
    original  = originalsource.data['image']
    original = original[0]
    xdim, ydim = sizesource.data['size']
    # your code...



    noisesource1 = ColumnDataSource(data={'image': [saltnpepper]})
    noisesource2 = ColumnDataSource(data={'image': [saltnpepper]})
    return noisesource1, noisesource2


# task1.2: create gaussian_filter function
# hint: input is the noisy image data source, output is the filtered image data source
# reference: https://docs.scipy.org/doc/scipy-0.16.1/reference/generated/scipy.ndimage.filters.gaussian_filter.html
def gauss_filter(noisesource, sigma):
    noisy = np.asarray(noisesource.data['image'])
    noisy_img = noisy[0]
    # your code...


    gauss_source = ColumnDataSource(data={'image': [gauss]})
    return gauss_source



# task1.3: create median_filter function
# hint: input is the noisy image data source, output is the filtered image data source
# reference: https://docs.scipy.org/doc/scipy-0.16.1/reference/generated/scipy.ndimage.filters.median_filter.html
def med_filter(noisesource, sigma):
    noisy = np.asarray(noisesource.data['image'])
    noisy_img = noisy[0]
    # your code...


    med_source = ColumnDataSource(data={'image': [med]})
    return med_source



# ===================================================
# ======== Task2: create sliders and updates ========
# ===================================================

# task2.1: create noise control slider with range [0, 50] and proper title
# and gaussian filter control slider with range [0, 5] and proper title
# and median filter control slider with range [0, 50] and proper title
#slider_noise = Slider(...)
#slider_gaussian = Slider(...)
#slider_median = Slider(...)



# task2.2: create update function for noise slider
# hint1: when this function is triggered, salt_pepper() should be called, fig1 will show the noisy image
# hint2: you will need to update both imgsource and noisesource
def update_noise(attrname, old, new):
    print('update_noise(%d)' % new)
    ratio = slider_noise.value
    # hint: noise_density = ratio/100
    # your code...


    

# trigger function for noise slider




# task2.3: create update function for gaussian filter slider
# hint: when this function is triggered, gauss_filter() will be called, fig1 will show the denoised image based on the noisy input
def update_gaussian(attrname, old, new):
    print('update_gaussian(%f)' % new)
    sigma = slider_gaussian.value
    # your code...




# trigger function for gaussian filter slider
# your code...




# task2.4: create update function for median filter slider
# hint: when this function is triggered, med_filter() will be called, fig1 will show the denoised image based on the same noisy input
def update_median(attrname, old, new):
    print('update_median(%d)' % new)
    size = slider_median.value
    # your code...




# trigger function for median filter slider
# your code..



# ===================================================
# ======= Task3: create figures and dashboard =======
# ===================================================

# creating figures and dashboard
xdim, ydim = sizesource.data['size']
fig_args = {'x_range':(0, xdim),'y_range':(0, ydim), 'tools':''}
img_args = {'x':0, 'y':0, 'dw':xdim, 'dh':ydim}


# create figure drawing function for fig1
# this function takes DataColumnSource as input
fig1 = figure(title="Original", width=int(1.4*xdim), height=int(1.4*ydim), **fig_args)
fig1.image_rgba(image='image', source=imgsource, **img_args) 


# task3: use row() and column() to place the final dashboard properly
row = row(fig1, select_image)
show(row)


curdoc().title = "dva_exc2"


# In[ ]:





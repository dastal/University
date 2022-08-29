#!/usr/bin/env python
# coding: utf-8

# In[6]:


"""
instruction: run with bokeh
bokeh serve --show dvc_exc2_skeleton.py
"""

import numpy as np
from numpy.random import rand
from PIL import Image
from bokeh.plotting import figure, curdoc, show
from bokeh.layouts import column, row
from bokeh.models.widgets import Panel, Tabs, Slider
from bokeh.models import ColumnDataSource
import random #new
from bokeh.layouts import widgetbox #new
from bokeh.layouts import layout #new


# ==============================================
# ============ Task1: create images ============
# ==============================================

# read image and convert it to an array
# replace the image with "panda2.jpg" if you get the error message from command line: 
# "WebSocket connection closed: code=None, reason=None"
data_img = Image.open('panda.jpg').convert('RGBA')
xdim, ydim = data_img.size
original = np.flipud(np.asarray(data_img))

# task1.1: compute R, G, B components of the image
# hint: be aware that the image now has four channels: R, G, B, Alpha, Alpha channel should be the same
# hint: for example, to get the red component, keep red channel and alpha unchanged, set green and blue channel zero.

red = original.copy()
red[:,:,1] = 0
red[:,:,2] = 0

green = original.copy()
green[:,:,0] = 0
green[:,:,2] = 0

blue = original.copy()
blue[:,:,0] = 0
blue[:,:,1] = 0


# task1.2: compute YUV iamge and Y, U, V components of the image original
# hint: first compute Y, U, V components, then YUV image is [Y, U, V, alpha], Y image is [Y, Y, Y, alpha], etc.

image2 = original.copy()

r = image2[:, :, 0]
g = image2[:, :, 1]
b = image2[:, :, 2]

y = (0.299 * r) + (0.587 * g) + (0.114 * b)
u = (-0.147 * r) + (-0.289 * g) + (0.436 * b) + 128
v = (0.615 * r) + (-0.515 * g) + (0.100 * b) + 128               
        
yuv = y / 3 + u / 3 + v / 3

y_channel = np.zeros(original.shape, np.uint8)
u_channel = np.zeros(original.shape, np.uint8)
v_channel = np.zeros(original.shape, np.uint8)
yuv_image = np.zeros(original.shape, np.uint8)

#Y channel
for i in range(len(y)):                      #clip the values to the range 16,235
    for j in range(len(y[i])):
        y[i][j] = np.clip(y[i][j],16,235)

for i in range(len(y)):                      #transcripting the values into the y_channel
    for j in range(len(y[i])):
        y_channel[i][j] = [y[i][j],y[i][j],y[i][j],255]

#U channel
for i in range(len(u)):                      #clip the values to the range 16,240
    for j in range(len(u[i])):
        u[i][j] = np.clip(u[i][j],16,240)

for i in range(len(u)):                      #transcripting the values into the u_channel
    for j in range(len(u[i])):
        u_channel[i][j] = [u[i][j],u[i][j],u[i][j],255]

#V channel
for i in range(len(v)):                      #clip the values to the range 16,240
    for j in range(len(v[i])):
        v[i][j] = np.clip(v[i][j],16,240)

for i in range(len(v)):                      #transcripting the values into the v_channel
    for j in range(len(v[i])):
        v_channel[i][j] = [v[i][j],v[i][j],v[i][j],255]
        
#YUV image
for i in range(len(yuv)):                    #transcripting the values into the v_channel
    for j in range(len(yuv[i])):
        yuv_image[i][j] = [y[i][j],u[i][j],v[i][j],255]


# construct image data source for further processing
# reason for using ColumnDataSource: easy way to implement the update function
imgsource = ColumnDataSource(data={'image': [original]})


# ====================================================
# ========== Task2: create noise functions ===========
# ====================================================

# task2.1: create salt and pepper noise function
# hint: the input is noise_density, i.e. the amount of pixels as noise in the output image, 
# return value is the noisy image data source
def salt_pepper(noise_density):
    rows, columns, channel = original.shape
    
    ratio = noise_density/100
    
    noiseImage = original.copy()
    
    for i in range(rows):
        for j in range(columns):
            random_number = random.random()
            if random_number < ratio/2:
                noiseImage[i][j] = [0,0,0,255]
            elif random_number < ratio:
                noiseImage[i][j] = [255,255,255,255]
            else:
                noiseImage[i][j] = original[i][j]

    noisesource = ColumnDataSource(data={'image': [noiseImage]})
    return noisesource


# ===================================================
# ======== Task3: create sliders and updates ========
# ===================================================

# task3.1: create noise control slider with range [0, 50] and proper title
# reference: https://bokeh.pydata.org/en/latest/docs/user_guide/interaction/widgets.html#slider

slider_noise = Slider(start=0, end=50, value=0, step=1, title="Salt & Pepper (%)")

# task3.2: create update function (or callback function) for noise slider
# hint: when this function is triggered, salt_pepper() should be called
# salt_pepper will take the slider's value as input and return a noise data source
# imgsource.data will then update with noise data source
def update_noise(attrname, old, new):
    print('update_noise(%d)' % new)
    ratio = slider_noise.value
    noise = salt_pepper(ratio)
    noisesource.data.update(noise.data)
    # end of function

# trigger update function (or callbacks) for noise slider

slider_noise.on_change('value', update_noise)


# ===================================================
# ======= Task4: create figures and dashboard =======
# ===================================================

# creating figures and dashboard
fig_args = {'x_range':(0, xdim),'y_range':(0, ydim), 'tools':''}
img_args = {'x':0, 'y':0, 'dw':xdim, 'dh':ydim}
xdim2 = xdim//3
ydim2 = ydim//3

# create figure drawing function for fig1
# this function takes DataColumnSource as input
fig1 = figure(title="Original", width=int(1.5*xdim), height=int(1.5*ydim), **fig_args)
fig1.image_rgba(image='image', source=imgsource, **img_args)


# task4.1: draw eight small figures to display RGB image and YUV image
# hint: put RGB, R, G, B in tab1 and YUV, Y, U, V in tab2
# then put tab1 and tab2 in one figure
fig2_1 = figure(title="RGB", width=xdim2, height=ydim2, **fig_args)
fig2_1.image_rgba(image=[original], **img_args)

fig2_2 = figure(title="R", width=xdim2, height=ydim2, **fig_args)
fig2_2.image_rgba(image=[red], **img_args)

fig2_3 = figure(title="G", width=xdim2, height=ydim2, **fig_args)
fig2_3.image_rgba(image=[green], **img_args)

fig2_4 = figure(title="B", width=xdim2, height=ydim2, **fig_args)
fig2_4.image_rgba(image=[blue], **img_args)

fig3_1 = figure(title="YUV", width=xdim2, height=ydim2, **fig_args)
fig3_1.image_rgba(image=[yuv_image], **img_args)

fig3_2 = figure(title="Y", width=xdim2, height=ydim2, **fig_args)
fig3_2.image_rgba(image=[y_channel], **img_args)

fig3_3 = figure(title="U", width=xdim2, height=ydim2, **fig_args)
fig3_3.image_rgba(image=[u_channel], **img_args)

fig3_4 = figure(title="V", width=xdim2, height=ydim2, **fig_args)
fig3_4.image_rgba(image=[v_channel], **img_args)


# reference: https://bokeh.pydata.org/en/latest/docs/reference/models/widgets.panels.html
tab1 = Panel(child=column(fig2_1, fig2_2, fig2_3, fig2_4), title="RGB")
tab2 = Panel(child=column(fig3_1, fig3_2, fig3_3, fig3_4), title="YUV")
tab = Tabs(tabs=[tab1, tab2 ])


# task4.2: use row() and column() to place the final dashboard properly
layout = layout([widgetbox(slider_noise)], [fig1, tab])
show(layout)
curdoc().add_root(layout)
curdoc().title = "dvc_exc2"


# In[ ]:





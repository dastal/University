#!/usr/bin/env python
# coding: utf-8

# In[ ]:


from __future__ import print_function
import numpy as np
from bokeh.layouts import gridplot
from bokeh.models.glyphs import Circle
from bokeh.models import (BasicTicker, ColumnDataSource, Grid, LinearAxis,
                         DataRange1d, Button, Plot)
from bokeh.sampledata.iris import flowers
from bokeh.plotting import figure, curdoc, show
from bokeh.layouts import column, row


# construct the ground truth labels for later use
colors = ['red'] * 50
colors.extend(['green'] * 50)
colors.extend(['blue'] * 50) 

# read and store the dataset
data = flowers.copy(deep=True)
data = data.drop(['species'], axis=1)


# Task2: generate 3 unrepeatable numbers from 0 to c and set them as initial centers 
# with color 'red', 'green' and 'blue', and 'grey' for the remaining points, store them in a list "color_initial"
# use np.random.choice() to generate the random numbers
k = 3 # number of clusters
c = data.shape[0] # number of points
colors_initial = ['grey'] * c

three_random_numbers = np.random.choice(c,3)
three_random_numbers = np.sort(three_random_numbers)

colors_initial[three_random_numbers[0]] = 'red'
colors_initial[three_random_numbers[1]] = 'green'
colors_initial[three_random_numbers[2]] = 'blue'

colorOrisource = ColumnDataSource(data={'color': [colors_initial]})


# initiate ksource, the datasource for the centers K as k1, k2 and k3 
# k1, k2, k3 are basically data points extracted form the data at three random locations you computed before
# to do so, use data.loc[position]
k1 = data.loc[[three_random_numbers[0]]]
k1 = k1.values
k2 = data.loc[[three_random_numbers[1]]]
k2 = k2.values
k3 = data.loc[[three_random_numbers[2]]]
k3 = k3.values

ksource = ColumnDataSource(data={
    'k1': k1,
    'k2': k2,
    'k3': k3
})


# Task3.1: create new color when updating
# in this function, you will first extract three centers k1, k2, k3 from ksource, then calculate the distances of 
# each point to these three centers
# then assign each point to the closest 'center' (i.e. set it the color of that center), this will result a list 
# of new color
# you can assign the new color using for loop
def make_color(data, ksource):
    k1 = ksource.data['k1']
    k2 = ksource.data['k2']
    k3 = ksource.data['k3']
    
    data = data.values
    
    distance = np.zeros( (c,k) )
    distance[:,0] = np.linalg.norm(np.array(data)-k1, axis = 1)
    distance[:,1] = np.linalg.norm(np.array(data)-k2, axis = 1)
    distance[:,2] = np.linalg.norm(np.array(data)-k3, axis = 1)

    color_update = colors.copy()
    
    for i in range(len(distance)):
        minimum_distance = distance[i][0]
        minimum_distance_index = 0
        for j in range(len(distance[i])):
            if distance[i][j] < minimum_distance:
                minimum_distance = distance[i][j]
                minimum_distance_index = j
        if minimum_distance_index == 0:
            color_update[i] = 'red'
        elif minimum_distance_index == 1:
            color_update[i] = 'green'
        else:
            color_update[i] = 'blue'
   
    colornewsource = ColumnDataSource(data={'color': [color_update]})
    return colornewsource

# Task3.2: create new source for later updating and plotting
# reference: http://bokeh.pydata.org/en/latest/docs/gallery/iris_splom.html
# put the source in this reference into a function, input is colorsource, output is the source
# you should first extract the color list from colorsource and store it into flowers['color'] 
def make_source(colorsource):
    flowers['color'] = colorsource.data['color'][0]
    source = ColumnDataSource(
        data=dict(
            petal_length=flowers['petal_length'],
            petal_width=flowers['petal_width'],
            sepal_length=flowers['sepal_length'],
            sepal_width=flowers['sepal_width'],
            color=flowers['color']
        )
    )
    return source


dataOrisource = make_source(colorOrisource)
source = dataOrisource # for initial plotting


# Task 3.3: create ksource updating function
# input is source, output is the new ksource
# first read updated color list from updated source, extract separately red, green and blue colored points as 
# three new clusters
# then calculate new center of each cluster using np.mean()
# finally construct the new ksource with k1, k2 and k3, each will be assigned with the new centers of each cluster
def make_k(source):
    
    color = source.data['color']
    newdata = flowers
    newdata['color'] = color
    newdata = newdata.drop(['species'], axis=1)
    
    datared = newdata.loc[newdata['color']== 'red']
    datared = datared.drop(['color'], axis = 1)
    datared = datared.values
    meanred = np.mean(datared, axis = 0)
    
    datagreen = newdata.loc[newdata['color']== 'green']
    datagreen = datagreen.drop(['color'], axis = 1)
    datagreen = datagreen.values
    meangreen = np.mean(datagreen, axis = 0)
    
    datablue = newdata.loc[newdata['color']== 'blue']
    datablue = datablue.drop(['color'], axis = 1)
    datablue = datablue.values
    meanblue = np.mean(datablue, axis = 0)

    knew = ColumnDataSource(data={
        'k1': meanred,
        'k2': meangreen,
        'k3': meanblue
    })
    return knew


# Task 4: Calculate the purity of the clustering algorithm
# input is colorsource, output is the resulting value
# use np.unique() to count the maximum number of same color in each of the clusters
# add all three numbers of correctly clustered points and divide it by the total number of points (150)
def commatch(colorsource):
    colornew = colorsource.data['color'][0]
    
    color_types, color_counts = np.unique(colornew, return_counts=True)
    
    count_red = 0
    count_green = 0
    count_blue = 0
    
    for i in range(0,49):
        if colors[i] == 'red' and colornew[i] == 'red':
            count_red += 1
    
    for i in range(50,99):
        if colors[i] == 'green' and colornew[i] == 'green':
            count_green += 1

    for i in range(100,149):
        if colors[i] == 'blue' and colornew[i] == 'blue':
            count_blue += 1  
         
    purity_score = (count_red + count_green + count_blue)/150
            
    return purity_score


def update_kmeans():

    colornew = make_color(data, ksource) # assign new labels for each data
    matchcount = commatch(colornew) # compute the purity for evaluation

    datasource = make_source(colornew) # update datasource with the new labels (plotting)
    source.data.update(datasource.data) 
    
    newk = make_k(source) # update centers for each cluster
    
    print("purity: %f" %matchcount)
    ksource.data.update(newk.data)


# https://bokeh.pydata.org/en/latest/docs/user_guide/interaction/widgets.html#userguide-interaction-widgets
button = Button(label="Click to apply k-means clustering", button_type="success")
button.on_click(update_kmeans)


# Task1: create the scatter matrix
# reference: http://bokeh.pydata.org/en/latest/docs/gallery/iris_splom.html
# add the 'source' as additional input parameter for the purpose of adding interaction later
# don't blindly copy all the code, you don't need the doc and you also don't need the main function

xdr = DataRange1d(bounds=None)
ydr = DataRange1d(bounds=None)

def make_plot(xname, yname, xax=False, yax=False):
    mbl = 40 if yax else 0
    mbb = 40 if xax else 0
    plot = Plot(
        x_range=xdr, y_range=ydr, background_fill_color="#efe8e2",
        border_fill_color='white', plot_width=200 + mbl, plot_height=200 + mbb,
        min_border_left=2+mbl, min_border_right=2, min_border_top=2, min_border_bottom=2+mbb)

    circle = Circle(x=xname, y=yname, fill_color="color", fill_alpha=0.2, size=4, line_color="color")
    r = plot.add_glyph(source, circle)

    xdr.renderers.append(r)
    ydr.renderers.append(r)

    xticker = BasicTicker()
    if xax:
        xaxis = LinearAxis()
        xaxis.axis_label = xname
        plot.add_layout(xaxis, 'below')
        xticker = xaxis.ticker
    plot.add_layout(Grid(dimension=0, ticker=xticker))

    yticker = BasicTicker()
    if yax:
        yaxis = LinearAxis()
        yaxis.axis_label = yname
        yaxis.major_label_orientation = 'vertical'
        plot.add_layout(yaxis, 'left')
        yticker = yaxis.ticker
    plot.add_layout(Grid(dimension=1, ticker=yticker))

    return plot

xattrs = ["petal_length", "petal_width", "sepal_width", "sepal_length"]
yattrs = list(reversed(xattrs))
plots = []

for y in yattrs:
    row = []
    for x in xattrs:
        xax = (y == yattrs[-1])
        yax = (x == xattrs[0])
        plot = make_plot(x, y, xax, yax)
        row.append(plot)
    plots.append(row)

grid = gridplot(plots)

curdoc().add_root(column(button, grid))
curdoc().title = "DVA_exc_3"


# In[ ]:





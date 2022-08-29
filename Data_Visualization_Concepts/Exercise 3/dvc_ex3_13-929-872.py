#!/usr/bin/env python
# coding: utf-8

# In[3]:


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
import os
# reference1 (function): https://stackoverflow.com/questions/8230638/parallel-coordinates-plot-in-matplotlib
# reference2 (correct the y scale): https://matplotlib.org/api/_as_gen/matplotlib.axes.Axes.plot.html
# reference3 (remove outside frame): https://stackoverflow.com/questions/22016965/removing-frame-while-keeping-axes-in-pyplot-subplots/44216223
# reference4 (add title and label): https://matplotlib.org/gallery/subplots_axes_and_figures/figure_title.html
#                                   https://stackoverflow.com/questions/9290938/how-to-set-my-xlabel-at-the-end-of-xaxis


def parallel_coordinates(data_sets, style=None):
    
    dimensions = len(data_sets[0])
    x_axis = range(dimensions)
    fig, axes = plt.subplots(1, dimensions-1, sharey=False)
    # feature 2
    fig.suptitle('Iris Data in Parallel Coordinates', fontsize=16)

    if style is None:
        style = ['r-']*len(data_sets)
        
    # Calculate the limits on the data
    min_max_range = list()
    for i in zip(*data_sets):
        minimum = min(i)
        maximum = max(i)
        if minimum == maximum:
            minimum -= 0.5
            maximum = minimum + 1.
        r  = float(maximum - minimum)
        min_max_range.append((minimum, maximum, r))
    
    # Normalize the data sets
    norm_data_sets = list()
    for ds in data_sets:
        nds = [(value - min_max_range[dimension][0]) / 
                min_max_range[dimension][2] 
                for dimension,value in enumerate(ds)]
        norm_data_sets.append(nds)
    data_sets = norm_data_sets
    
    # Plot the datasets on all the subplots
    for i, ax in enumerate(axes):
        for dsi, d in enumerate(data_sets):
            ax.plot(x_axis, d, style[dsi], linewidth = 1)
        ax.set_xlim([x_axis[i], x_axis[i+1]])
        ax.set_ylim(0,1) #this is the missing thing for stage 2
    
    # Set the x axis ticks 
    for dimension, (axx,xx) in enumerate(zip(axes, x_axis[:-1])):
        axx.xaxis.set_major_locator(ticker.FixedLocator([xx]))
        ticks = len(axx.get_yticklabels())
        y_range = range(ticks)
        labels = list()
        step = min_max_range[dimension][2] / (ticks-1)
        mn   = min_max_range[dimension][0]
        for i in y_range:
            v = mn + i*step
            labels.append('%4.2f' % v)
        axx.set_yticklabels(labels)
        # feature 1
        axx.spines["top"].set_visible(False)
        axx.spines["bottom"].set_visible(False)
        
    # Move the final axis' ticks to the right-hand side
    axx = plt.twinx(axes[-1])
    dimension += 1
    axx.xaxis.set_major_locator(ticker.FixedLocator([x_axis[-2], x_axis[-1]]))
    ticks = len(axx.get_yticklabels())
    step = min_max_range[dimension][2] / (ticks-1)
    mn   = min_max_range[dimension][0]
    labels = ['%4.2f' % (mn + i*step) for i in y_range]
    axx.set_yticklabels(labels)
    # feature 1
    axx.spines["top"].set_visible(False)
    axx.spines["bottom"].set_visible(False)
    
    # Stack the subplots 
    plt.subplots_adjust(wspace=0)
    
    # feature 2
    locs, labels = plt.xticks()
    plt.xticks(np.arange(4), ('', '', '2\nPetal Width', '3\nPetal Length'))
    plt.sca(axes[0])
    plt.xticks(range(2), ['0\nSepal Width', '1\nSepal Length'])
    
    return plt   
    
    # end of the function

    
if __name__ == '__main__':
    __file__ = 'iris.csv'
    my_absolute_dirpath = os.path.abspath(os.path.dirname(__file__))
    colors = ['r'] * 50
    colors.extend(['g'] * 50)
    colors.extend(['b'] * 50)
    
    # read data from .csv file
    df = pd.read_csv('iris.csv').rename(index=str, columns = {"SepalLength": "s_length",
                                                              "SepalWidth": "s_width",
                                                              "PetalLength": "p_length",
                                                              "PetalWidth": "p_width",
                                                              "Name": "name"})

    # order the components
    cols = df.columns.tolist()
    cols = [cols[1], cols[0], cols[3], cols[2], cols[4]]
    df = df[cols]

    # group by different names
    Iris_setosa = df.loc[df['name'] == 'Iris-setosa']
    Iris_versicolor = df.loc[df['name'] == 'Iris-versicolor']
    Iris_virginica = df.loc[df['name'] == 'Iris-virginica']

    # delete the name column
    del Iris_setosa['name']
    del Iris_versicolor['name']
    del Iris_virginica['name']

    # integrate the df's together
    frames = [Iris_setosa,Iris_versicolor,Iris_virginica]
    data = pd.concat(frames)
    data_list = data.values.tolist()
    
    fig1 = parallel_coordinates(data_list, style=colors)

    # end of your main function


#!/usr/bin/env python
# coding: utf-8

# In[7]:


import numpy as np
import pandas as pd
from bokeh.layouts import layout
from bokeh.io import show
from bokeh.models import ColumnDataSource, HoverTool
from bokeh.plotting import figure
from bokeh.palettes import Category10, Viridis256
import numpy.polynomial.polynomial as poly
from bokeh.models import Range1d
import matplotlib.pyplot as plt
from bokeh.models import Legend
from operator import sub

# read data from .csv file and rename
df1 = pd.read_csv('20151001_hundenamen.csv').rename(index=str, columns={"HUNDENAME": "name", 
                                                                        "GEBURTSJAHR_HUND": "birth_year", 
                                                                        "GESCHLECHT_HUND": "gender"})
NumberPerBornYear = df1.groupby(['birth_year']).size()

data = {'Years' : list(NumberPerBornYear.index),
        'Numbers'   : list(NumberPerBornYear)}


# ====================================================================
# =============== 1. data cleaning and basic plotting ================
# ====================================================================
df = pd.DataFrame(data, columns = ['Years', 'Numbers'])
# task 1.1: remove the outlier and construct ColumnDataSource from the clean DataFrame
# hint: use df.loc to remove the outliers as specified in the assignment document
# then reset the index of DataFrame before constructing ColumnDataSource

df = df.loc[df['Years']>1993]
df = df.loc[df['Years']<2016]

source = ColumnDataSource(data=df)

# task 1.2: configure mouse hover tool

x = data['Years']
y = data['Numbers']

tooltips1 = [
    ('Year: ', '@x'),
    ('Number: ', '@y')
]

# task 1.3: draw figure p1 and add a circle renderer with a size, color, and alpha
# reference: https://bokeh.pydata.org/en/latest/docs/user_guide/plotting.html#scatter-markers
# hint: in figure() function, set proper values for x_range and y_range, x and y labels, plot_height, plot_width
# and title
# in circle() function, set preferred values for size, color and alpha

p1 = figure(plot_width=1500, plot_height = 800, toolbar_location = None, 
            title = 'Number of Dogs born per Year in Zurich', tools = 'hover', 
            tooltips=tooltips1)

p1.circle(x[-24:-2],y[-24:-2],size=5, color="navy", alpha=0.5)

p1.x_range = Range1d(1993,2019)
p1.y_range = Range1d(-300,700)
p1.xaxis.axis_label = 'Year'
p1.yaxis.axis_label = 'Number of Dogs'


# ======================================================================
# ============= 2. Plotting fitting curves and error bars ==============
# ======================================================================

# extract and store the original data in array for further processing
x = np.array(df['Years'])
y = np.array(df['Numbers'])

# task 2.1: construct a new array x_new goes from x[0] to x[-1] with step size of 0.1
# hint: use numpy.linspace() for this task
# x_new should looks like: array([1994., 1994.1, 1994.2, ..., 2014.7, 2014.8, 2014.9, 2015.])

x_new = np.linspace(x[0], x[-1]+0.9, num=len(x)*10) # 0.9 because in 2015 there shall also be a fitting line

# task 2.2: draw figure p2 with proper settings for x_range, x and y axis label, plot_height, plot_width and title
# hint: later you will draw all the error bars in p2

p2 = figure(plot_width=1500, plot_height=300, toolbar_location=None, title='Error Bars')

p2.x_range = Range1d(1993,2019)
p2.y_range = Range1d(-300,500)
p2.xaxis.axis_label = 'Fitting Error'
p2.yaxis.axis_label = 'Year'

# task 2.3: draw fitting lines in p1 and error bars in p2 in the for loop
for i in np.arange(1, 11):
    deg = i  # degree of each polynomial fitting, from 1 to 10
    color = Category10[10][deg - 1]  # color used in both fitting curves and error bars
    # hint: use polyfit() to calculate fitting coefficients and polyval() to calculate estimated y on the fitting line.
    
    coefs = poly.polyfit(x, y, deg)

    estimated_y = poly.polyval(x_new, coefs)

    # hint: construct new ColumnDataSource for fitting curve, x should be x_new, y should be the estimated y.
    
    data = {'x': x, 'y': estimated_y[::10]}        # estimated_y[::10] because in the fitting line I want all the 10 
                                                   # fitting errors to be measured at the same x value
    
    source = ColumnDataSource(data)

    # hint: draw fitting lines in p1 using line(), add proper source, legend, color, line_width and line_alpha
    
    p1.line(x_new[:-9], estimated_y[:-9], color=color, legend='fitting oder = {}'.format(deg), line_width=1, alpha=0.5)

    # draw the error bars in p2
    # hint: calculate fitting error by subtracting original y from estimated y in each year
    
    fitting_error = [y1 - y2 for y1, y2 in zip(estimated_y[::10], y)]

    # hint: before plotting, make sure all the bars could be properly placed, i.e. adjust the x position for each bar 
    
    x_final = x_new[deg-1::10]

    # hint: construct ColumnDataSource for error bar chart, x should be properly , y should be the error calculated
    
    data = {'x':x_final, 'y':fitting_error}
    
    source = ColumnDataSource(data)

    # hint: draw the error bars using vbar() and set proper values for width, top, fill_color, line_color, alpha 
    # and source
    
    p2.vbar(x='x', top='y', width=0.05, source=source, line_color=color, fill_color=color, alpha=0.8)

    # end of for loop

# set up the position of legend in p1 as you like
p1.legend.location = 'top_left'


# ==============================================
# ================= dashboard ==================
# ==============================================

# put all the plots into one layout
# reference: https://bokeh.pydata.org/en/latest/docs/user_guide/layout.html
# fill in the function

dashboard = layout(
    [p1],
    [p2]
)

show(dashboard)


# In[ ]:





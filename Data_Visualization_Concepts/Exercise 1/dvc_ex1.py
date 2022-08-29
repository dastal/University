import pandas as pd
from bokeh.layouts import layout
from bokeh.core.properties import value
from bokeh.io import show
from bokeh.models import ColumnDataSource, HoverTool
from bokeh.plotting import figure
from bokeh.palettes import Category20c
from bokeh.transform import cumsum
from math import pi
from bokeh.models import Range1d
from bokeh.layouts import row


# read data from .csv file as dataframe and rename the column names
df1 = pd.read_csv('20151001_hundenamen.csv').rename(index=str, columns={"HUNDENAME": "name", "GEBURTSJAHR_HUND": "birth_year", "GESCHLECHT_HUND": "gender"})
df2 = pd.read_csv('20160307_hundenamen.csv').rename(index=str, columns={"HUNDENAME": "name", "GEBURTSJAHR_HUND": "birth_year", "GESCHLECHT_HUND": "gender"})
df3 = pd.read_csv('20170308_hundenamen.csv').rename(index=str, columns={"HUNDENAME": "name", "GEBURTSJAHR_HUND": "birth_year", "GESCHLECHT_HUND": "gender"})
df4 = pd.read_csv('20180305_hundenamen.csv').rename(index=str, columns={"hundename": "name", "geburtsjahr_hund": "birth_year", "geschlecht_hund": "gender"})

# add addtional "year" information for eath data and concatenate them into one dataframe
df1['Year'] = '2015'
df2['Year'] = '2016'
df3['Year'] = '2017'
df4['Year'] = '2018'
df = [df1, df2, df3, df4]
df = pd.concat(df)


# ==============================================
# ============= plot 1: bar chart ==============
# ==============================================

# seperate male dog and female dog into two dataframes
male = df.loc[df['gender'] == 'm']
female = df.loc[df['gender'] == 'w']

# count the number of dog in each year
maleDogPerYear = male.groupby(['Year']).size()
femaleDogPerYear = female.groupby(['Year']).size()

# construct the data source for plotting
categories = ["males", "females"]
colors = ["#718dbf", "#e84d60"] # feel free to change the colors as you wish
data = {'Years': list(maleDogPerYear.index),
        'males': list(maleDogPerYear),
        'females': list(femaleDogPerYear)}
source = ColumnDataSource(data=data)

# task 1.1: configure mouse hover tool
# your tooltip should contain "Year", "Male Number", and "Female Number"
# reference:

tooltips1 = [
    ("Year: ", "@Years"),
    ("Male Number: ", "@males"),
    ("Female Number: ", "@females"),
]

# task 1.2: plot the bar chart named p1
# hint: first use figure() to draw the outline, set parameters to proper values, then use vbar_stack()
# to draw the plot

p1 = figure(x_range = data ['Years'], plot_height = 750, title = 'Number of Dogs for Zurich from 2015 to 2018',
            toolbar_location=None, tools="hover", tooltips=tooltips1)

p1.vbar_stack(categories, x='Years', width=0.9, color=colors, source=data,
             legend=[value(x) for x in categories])

# task 1.3: overall plot settings for p1
# reference: https://bokeh.pydata.org/en/latest/docs/user_guide/categorical.html
# hint: set proper values for y_range.start, x_range.range_padding, legend, etc.

p1.y_range.start = 0
p1.yaxis.axis_label = "Number of Dogs"
p1.x_range.range_padding = 0.1
p1.xgrid.grid_line_color = None
p1.axis.minor_tick_line_color = None
p1.outline_line_color = None
p1.legend.location = "top_left"
p1.legend.orientation = "horizontal"

# show(p1)  # uncomment this if you want to show the plotting result of p1


# ==============================================
# =========== Plot 2: circle chart =============
# ==============================================

# construct the data source for plotting
NumberPerBornYear = df4.groupby(['birth_year']).size()
data = {'Years': list(NumberPerBornYear.index),
        'Numbers': list(NumberPerBornYear)}
source = ColumnDataSource(data=data)

# task 2.1: configure mouse hover tool
# your tooltip should contain "Year" and "Number"
# your code ...

tooltips2 = [
    ("Year: ", "@x"),
    ("Number: ", "@y"),
]

# task 2.2: plot a scatter and a line in p2
# reference: https://bokeh.pydata.org/en/latest/docs/user_guide/plotting.html
# hint: use circle() and line() for this task, add a circle renderer with a size, color, alpha, add a line
# renderer with color and line_width
# your code ...

x = data['Years']
y = data['Numbers']
x.append(2018)
y.append(0)

p2 = figure(plot_width=550, plot_height=750, title = 'Number of Dogs born per Year from 1996 to 2017', toolbar_location=None,
            tools="hover", tooltips=tooltips2)

p2.line(x[2:], y[2:], line_width=0.7, color = "green")
p2.circle(x[2:], y[2:], color = "blue", fill_color="blue", size=3, alpha = 0.5)

p2.xaxis.axis_label = "Year"
p2.yaxis.axis_label = "Number of Dogs"
p2.x_range = Range1d(1995,2019)

# show(p2)

# ==============================================
# ============= Plot 3: pie chart ==============
# ==============================================

# extract and construct necessary data source
NumberNamedABC = (df4['name'].str.startswith('A') | df4['name'].str.startswith('B') | df4['name'].str.startswith('C')).sum()
NumberNamedDEF = (df4['name'].str.startswith('D') | df4['name'].str.startswith('E') | df4['name'].str.startswith('F')).sum()
NumberNamedGHI = (df4['name'].str.startswith('G') | df4['name'].str.startswith('H') | df4['name'].str.startswith('I')).sum()
NumberNamedJKL = (df4['name'].str.startswith('J') | df4['name'].str.startswith('K') | df4['name'].str.startswith('L')).sum()
NumberNamedMNO = (df4['name'].str.startswith('M') | df4['name'].str.startswith('N') | df4['name'].str.startswith('O')).sum()
NumberNamedPQR = (df4['name'].str.startswith('P') | df4['name'].str.startswith('Q') | df4['name'].str.startswith('R')).sum()
NumberNamedSTU = (df4['name'].str.startswith('S') | df4['name'].str.startswith('T') | df4['name'].str.startswith('U')).sum()
NumberNamedVWX = (df4['name'].str.startswith('V') | df4['name'].str.startswith('W') | df4['name'].str.startswith('X')).sum()
NumberNamedYZu = (df4['name'].str.startswith('Y') | df4['name'].str.startswith('Z') | df4['name'].str.startswith('u')).sum()

keys = ['ABC', 'DEF', 'GHI', 'JKL', 'MNO', 'PQR', 'STU', 'VWX', 'YZu']
values = [NumberNamedABC, NumberNamedDEF, NumberNamedGHI, NumberNamedJKL, NumberNamedMNO, NumberNamedPQR, NumberNamedSTU, NumberNamedVWX, NumberNamedYZu]
x = dict(zip(keys, values))

data = pd.DataFrame.from_dict(dict(x), orient='index').reset_index().rename(index=str, columns={0:'value', 'index': 'name'})
data['angle'] = data['value']/sum(x.values()) * 2 * pi
data['color'] = Category20c[len(x)]

# task 3.1: draw the pie chart
# in the figure() function, set up tooltip for "name" and "value"
# Reference: https://bokeh.pydata.org/en/latest/docs/gallery/pie_chart.html
# your code ...

tooltips3 = [
    ('Name: ', '@name'),
    ('Value: ', '@value'),
]

# task 3.2: overall setting for p3
# hint: set proper values for axis_lable, axis.visible, and grid_line_color
# your code ...

p3 = figure(plot_height=750, title = "Pie Chart of Dog-Names in Zurich in 2017 ",
            toolbar_location=None, tools="hover", tooltips=tooltips3)

p3.wedge(x=0, y=1, radius=0.75,
        start_angle=cumsum('angle', include_zero=True), end_angle=cumsum('angle'),
        line_color="white", fill_color='color', legend='name', source=data)

p3.axis.axis_label=None
p3.axis.visible=False
p3.grid.grid_line_color = None

# show(p3)

# ==============================================
# ================= dashboard ==================
# ==============================================

# task 4: put all the plots into one layout called "dashboard"
# reference: https://bokeh.pydata.org/en/latest/docs/user_guide/layout.html
# your code ...

show(row(p1, p2, p3))

# show(dashboard)
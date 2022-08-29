import pandas as pd
import numpy as np
import os
from bokeh.core.properties import field
from bokeh.io import curdoc, show
from bokeh.layouts import layout
from bokeh.models import (ColumnDataSource, HoverTool, SingleIntervalTicker,
                          Slider, Button, Label, CategoricalColorMapper)
from bokeh.palettes import Spectral8
from bokeh.plotting import figure


__file__ = 'countries.csv'
my_absolute_dirpath = os.path.abspath(os.path.dirname(__file__))
countries_df = pd.read_csv(os.path.join(my_absolute_dirpath,__file__))

__file__ = 'data.csv' # replace with 'data_short.csv' if facing memory error
my_absolute_dirpath = os.path.abspath(os.path.dirname(__file__))
indicators_df = pd.read_csv(os.path.join(my_absolute_dirpath,__file__)) 


# Hint: Go to the reference for more details: https://github.com/bokeh/bokeh/tree/master/examples/app/gapminder

# =====================================
# ====== Your code starts here ========
# =====================================

# D: disable false positive Warning
pd.options.mode.chained_assignment = None

# add one more column about population size into indicators_df
scale_factor = 200
min_size = 3
indicators_df["population_size"] = np.sqrt(indicators_df["population"] / np.pi) / scale_factor
indicators_df["population_size"] = indicators_df["population_size"].where(indicators_df["population_size"] >= min_size).fillna(min_size)


# extract dataframe for each indicator: life expactancy, population size and income
years = list(indicators_df["year"].unique())
countries = list(indicators_df["country"].unique())

life_expectancy = list(indicators_df["life_expectancy"])
population_size = list(indicators_df["population_size"])
income = list(indicators_df["income"])
index = []
le_data = []
ps_data = []
ic_data = []

count_c = 1
count_data = 1
years_int = 219

while count_c <= 182:
    country_data_le = {}
    country_data_ps = {}
    country_data_ic = {}
    le_temp = life_expectancy[years_int-219:years_int]
    ps_temp = population_size[years_int-219:years_int]
    ic_temp = income[years_int-219:years_int]
    for i in range(219):
        country_data_le[years[i]] = le_temp[i]
        country_data_ps[years[i]] = ps_temp[i]
        country_data_ic[years[i]] = ic_temp[i]
    count_c += 1
    years_int += 219
    le_data.append(country_data_le)
    ps_data.append(country_data_ps)
    ic_data.append(country_data_ic)

life_expectancy_df = pd.DataFrame(le_data)
life_expectancy_df.insert(0, "country", countries)
life_expectancy_df.set_index('country', inplace=True, drop=True)
population_size_df = pd.DataFrame(ps_data)
population_size_df.insert(0, "country", countries)
population_size_df.set_index('country', inplace=True, drop=True)
income_df = pd.DataFrame(ic_data)
income_df.insert(0, "country", countries)
income_df.set_index('country', inplace=True, drop=True)


# set up the regions_df
regions_list = list(countries_df["eight_regions"].unique())
regions_df = countries_df[["country", "eight_regions"]]
regions_df.set_index('country', inplace=True, drop=True)


# construct a compact dataframe and the data source
df = pd.concat({'income': income_df,
                'life_expectancy': life_expectancy_df,
                'population_size': population_size_df},
               axis=1)

data = {}

regions_df.rename({'eight_regions':'region'}, axis='columns', inplace=True)
for year in years:
    df_year = df.iloc[:,df.columns.get_level_values(1)==year]
    df_year.columns = df_year.columns.droplevel(1)
    data[year] = df_year.join(regions_df.region).reset_index().to_dict('series')

source = ColumnDataSource(data=data[years[0]])


###########################################################################################################
# plotting
plot = figure(x_range=(1, 9), y_range=(20, 100), title='Gapminder Data', plot_height=250)
plot.xaxis.ticker = SingleIntervalTicker(interval=1)
plot.xaxis.axis_label = "Income per Person"
plot.yaxis.ticker = SingleIntervalTicker(interval=20)
plot.yaxis.axis_label = "Life Expectancy at birth (Year)"

label = Label(x=1.1, y=18, text=str(years[0]), text_font_size='93px', text_color='#eeeeee')
plot.add_layout(label)

color_mapper = CategoricalColorMapper(palette=Spectral8, factors=regions_list)
plot.circle(
    x='income',
    y='life_expectancy',
    size='population_size',
    source=source,
    fill_color={'field': 'region', 'transform': color_mapper},
    fill_alpha=0.8,
    line_color='#7c7e71',
    line_width=0.5,
    line_alpha=0.5,
    legend_label='region'
)
plot.add_tools(HoverTool(tooltips="@country", show_arrow=False, point_policy='follow_mouse'))

# add update functions
def animate_update():
    year = slider.value + 1
    if year > years[-1]:
        year = years[0]
    slider.value = year


def slider_update(attrname, old, new):
    year = slider.value
    label.text = str(year)
    source.data = data[year]

slider = Slider(start=years[0], end=years[-1], value=years[0], step=1, title="Year")
slider.on_change('value', slider_update)

callback_id = None

def animate():
    global callback_id
    if button.label == 'Play':
        button.label = 'Pause'
        callback_id = curdoc().add_periodic_callback(animate_update, 200)
    else:
        button.label = 'Play'
        curdoc().remove_periodic_callback(callback_id)

button = Button(label='Play', width=60)
button.on_click(animate)

# add layout
layout = layout([
    [plot],
    [slider, button],
], sizing_mode='scale_width')

curdoc().add_root(layout)
curdoc().title = "Gapminder"

# imports
import pandas as pd
import numpy as np

import matplotlib.pyplot as plt
import seaborn as sns
import plotly.express as px
import plotly.io as pio
# pio.renderers.default = "png"
pio.renderers.default = 'vscode'
pio.templates.default = 'plotly'



# load the dataset
df = pd.read_csv("../../data/titanic/train.csv")
df = df.drop(columns = ['PassengerId'])

num_columns = df.select_dtypes(include=['int64', 'float64']).columns
cat_columns = df.select_dtypes(include=['object']).columns
target = 'Survived'
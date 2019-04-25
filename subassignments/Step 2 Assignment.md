# Pre-Analysis Plan (April 18, 2019)
### Abstract
This project analyzes the exposure to and sharing of fake news through data collected from Twitter and data by registered voters. These Twitter users are specific voters exposed to fake news, who helped endorse fake news, and the process that which fake news overlaps with factual news. This project analyzes the distribution of user interactions with fake news and looks at what types of voters have a tendency to these interactions.

### Data
Figure 1 contains 3 smaller figures which extract data from 3 data sets: figure_1b_data.csv, figure_1c_data.csv, and figure_1d_data.csv. These data sets account for the daily counts of fake news quantities in accordance to voters’ exposure. The data sets include: number of days after election days, number of red, orange, and black fake news sites users are exposed to, the total number of exposures in one day, the date of this day, the percentages of all shares and exposures to red, orange, black, and fake news sites. 

### Strategy
First, we will load the data from the CSV files and explore this data. We will categorize the variables, sort the data, remove outliers in the data (such as, bot-like panel members in addition to exclusion criterion in paper), and then we will plot the relevant data (Website Exposures). Then, we will observe if the percentage of fake news increases closer to the election by observing the inflection points in the plots.

1. Upload csv files
2. Remove outliers in data: bot-like panel members in addition to exclusion criterion in paper
3. Plot Website Exposures per month (plot for black, red, orange websites)
7. Observe data at inflection points and as time progresses closer to election date


### Analysis
The analysis exists in  `exp_share_regressions/exp_share_reg.Rmd` and shows the results of individual characteristics that are associated with the exposure and sharing of fake news. The paper’s sections 'who was exposed to fake news sources?' and 'who shared fake news sources?' also analyze the data. The analysis extracts the mean, lower and upper bound, percentiles, removes outliers in the process of data cleaning, and compares the distance of values from the average. 


### Deliverables
At the end of this project, we will present our findings in a presentation using Google slides. We will show the original and cleaned data sets in output folder and the pictures in images folder.


### Sources

E. McKernon, Fake news and the public. Harper’s Magazine 151, 528–536 (1925).

J. H. Kuklinski, P. J. Quirk, J. Jerit, D. Schwieder, R. F. Rich, Misinformation and the currency of democratic citizenship. J. Polit. 62, 790–816 (2000). doi:10.1111/0022-3816.00033

C. Silverman, “This analysis shows how viral fake election news stories outperformed real news on Facebook” (2016)

D. Ruths, J. Pfeffer, Social media for large studies of behavior. Science 346, 1063–1064 (2014). doi:10.1126/science.346.6213.1063pmid:25430759

S. Vosoughi, D. Roy, S. Aral, The spread of true and false news online. Science 359, 1146–1151 (2018). doi:10.1126/science.aap9559pmid:29590045

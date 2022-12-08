# **Allocation of Health: Project Proposal**
#### Code Name: **_DMoney_**
Amit Peled (apeled@uw.edu)        
Jeffrey Zeng (jmz1000@uw.edu)  
Shawn Leonard (sleo14@uw.edu)        

*INFO-201: Technical Foundations of Informatics*  
*The Information School*   
*University of Washington*      
*06 December 2022*  

### **Abstract**
- We are concerned with countries' expenditure in regard to the physical health care provided for their citizens. Citizens' accessibility to care draws great worry and is important as many countries in our world today are unable to provide their citizens with adequate medicines and treatment. To address this concern and present correlation, we plan to analyze the healthcare expenditures, medicine availability, and depict a disease that impacts the livelihood of many individuals, HIV, within each country.

**Keywords:** Health; Medical Expenditure; Medicine Availability; HIV.

## **Introduction**

- For our project, we are analyzing the relationship between national healthcare expenditure and availability of medical resources globally. We will be examining three datasets with emphasis on current health expenditure per capita by country, generic medicine availability by country, and global HIV prevalence. In particular we are interested in how the way a country finances its health systems can affect various statistics about HIV like prevalence, mortality rates, and amount of people receiving adequate treatment. We aim to start our research on a broader scale by focusing on the relationship between medicine and health expenditure, and then narrow that down to impacts on HIV and AIDS. By wrangling this data, we hope to uncover certain trends that appear and create meaning behind them through our own visualizations and findings. We aim to display the insights gained during this data analysis in an effective manner for others to explore as well.

## **Problem Domain**
- **Project Framing:**
  - Three datasets related to global health and the relationships between them will be explored. We will conduct data analysis on these and report our findings through visualizations and well documented reports.

- **Human Values:**
  - The human values being supported by this research include democracy, fairness, and human dignity. The health of a country’s citizens is a responsibility that is bestowed upon every country and is therefore important to the whole world. As stated in the Declaration of Alma-Ata, “The Conference strongly reaffirms that health, which is a state of complete physical, mental, and social well-being, and not merely the absence of disease or infirmity, is a fundamental human right and that the attainment of the highest possible level of health is a most important world-wide social goal whose realization requires the action of many other social and economic sectors in addition to the health sector” ([World Health Organization](https://www.who.int/teams/social-determinants-of-health/declaration-of-alma-ata)).

- **Direct Stakeholders:**
  - The direct stakeholders of our research findings would be people looking to present evidence of trends between health expenditure and HIV prevalence.

- **Indirect Stakeholders:**
  - The indirect stakeholders would be the actual people in these countries who have HIV or people whose lives have been affected through death of a relative or friend.

- **Pros & Cons:**
  - A possible con of conducting this analysis is that we find no correlation between any of these factors and meaningful insights are not gained. Even during this scenario, the broad framing of our project during the beginning research stages allows us to be flexible and pivot to different directions if we see fit.

- **Similar Research:**
  - A study on the association between medical spending and citizen health was conducted in 2020 on a select group of African countries. Public health financing continues to be “highly unequal as more than 80% of the world's population live in low and middle-income countries but only account for about 20% of global health expenditure” ([National Library of Medicine](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7366161/)). This study focused on prevalence and mortality rates of tuberculosis and HIV. Another article on the relationship between public health spending and the U.S. economy stated that “the indirect costs associated with preventable chronic diseases—costs related to worker productivity as well as the resulting fiscal drag on the nation’s economic output—may exceed $1 trillion per year” ([Harvard School of Public Health](https://www.hsph.harvard.edu/news/magazine/public-health-economy-election/)). Public health is a topic that has both moral and economic implications.

## **Research Questions**
- Our first research question is to address if there is a connection between health expenditure and availability of generic medicines, specifically, is there a positive correlation between health expenditure per capita and availability of generic medicines? Answering this question would allow us to gain a better understanding of the impact that expenditure has on not just availability of medicines but by extension health as a whole.

- Next, we will connect the ideas of health expenditure and apply it to the case of HIV. Through this connection we will answer the question, does higher expenditure of a country per capita have any effect or correlation with prevalence of HIV within a country's population? This question allows us to see the direct effect that expenditure has on the prevalence of HIV and possibly other viruses and diseases.

- Finally, we will connect the ideas of availability of generic medicines to HIV also. This will allow us to address the question, does availability of generic medicines, and in turn the ability to treat HIV, within a countries population affect how prevalent HIV is within a target countries population?


## **The Dataset**
- **Current Health Expenditure (CHE) per Capita in US$: Data by Country**
  - This dataset contains information regarding the health expenditure per capita in USD for 192 different countries around the world. This dataset will help our project team analyze the allocation of money towards healthcare in different countries and see if any discrepancies between funding and accessibility to medicine or prevalence of HIV exits.

![che_dataset](che_dataset.png)

  - World Health Organization. Contact Us. [apps.who.int/gho/data/view.main.GHEDCHEpcUSSHA2011v?lang=en](apps.who.int/gho/data/view.main.GHEDCHEpcUSSHA2011v?lang=en). Accessed 31 Oct. 2022.

  \
  a)	This data was collected by the World Health Organization and was last updated on December 15, 2021. The data was collected and updated every year for the purpose of analysis by major corporations.
  \
  b)	WHO is funded by assessed contributions as well as voluntary contributions, as this organization deals with many more matters other than data collection.
  \
  c)	The data has been continuously updated to ensure its accuracy and is collected from government sources to ensure validity.
  \
  d)	The data was obtained directly from the WHO’s website, which is a credited source within itself.

- **Median Availability of Selected Generic Medicines: Data by Country**
  - This dataset contains information regarding the median availability of selected generic medicine to both public and private distributions within 37 different countries. This dataset will help our project team analyze the allocation of money towards healthcare in different countries and see if any discrepancies between accessibility to medicine and funding or prevalence of HIV exits.

![med_dataset](med_avail_dataset.png)

  - World Health Organization. Contact Us. [https://apps.who.int/gho/data/node.main.488?lang=en](https://apps.who.int/gho/data/node.main.488?lang=en). Accessed 31 Oct. 2022.

  \
  a)	This data was collected by the World Health Organization and was last updated on June  12, 2015.  The data was collected and updated every year for the purpose of analysis by major corporations.
  \
  b)	WHO is funded by assessed contributions as well as voluntary contributions, as this organization deals with many more matters other than data collection.
  \
  c)	The data has been continuously updated to ensure its accuracy and is collected from government sources to ensure validity.
  \
  d)	The data was obtained directly from the WHO’s website, which is a credited source within itself.

- **Prevalence of HIV Among Adults Aged 15 to 49: Estimates by Country**
  - This dataset contains information regarding the estimated prevalence of HIV among adults in 194 different countries. This dataset will help our project team analyze the allocation of money towards healthcare in different countries and see if any discrepancies between prevalence of HIV and funding or accessibility to medicine exits.

![hiv_dataset](prev_hiv_dataset.png)

  - World Health Organization. Contact Us. [https://apps.who.int/gho/data/view.main.22500?lang=en](https://apps.who.int/gho/data/view.main.22500?lang=en). Accessed 31 Oct. 2022.

  \
  a)	This data was collected by the World Health Organization and was last updated on June  12, 2015.  The data was collected and updated every year for the purpose of analysis by major corporations.
  \
  b)	WHO is funded by assessed contributions as well as voluntary contributions, as this organization deals with many more matters other than data collection.
  \
  c)	The data has been continuously updated to ensure its accuracy and is collected from government sources to ensure validity.
  \
  d)	The data was obtained directly from the WHO’s website, which is a credited source within itself.

## **Expected Implications**
- If our compiled data allows us to answer the questions that we are looking to answer then it could give us invaluable information on whether or not spending has an effect on the overall health of a country's population. If we find that higher expenditure has a negative correlation with prevalence of health conditions like HIV then we could apply this data to various policies, like the need for and the effectiveness of universal health care.

## **Limitations**
- One of the massive limitations that we need to address is the fact that the amount spent on healthcare is not exactly a perfect reflection of the overall health of a country. Each and every country has its own social and economic factors that may affect the amount that they spend on healthcare and the prevalence of health conditions like HIV within a country’s population. HIV is also not necessarily a perfectly clear indicator of overall health. This is why our conclusions would provide only a loose reflection of the overall health of a country.

## **Findings**
- The first of the key findings was there did see a negative correlation between health expenditure and prevalence of HIV. If we look at the data the locations with the lowest HIV rates do seem to be the locations that have the highest spending. If we take a deeper look at the graph we can see that many of the locations that have the highest spending, like Australia and Norway, have the lowest rates of HIV. While there are a few lower spending countries that are included in the lowest HIV rates there are no high spending countries within the highest HIV rates. This means that the answer to the question of whether or not there is a correlation between health expenditure and HIV prevalence is that there is likely a negative correlation between the two.
- The next of our key findings is between availability of generic medicines and HIV and we found that there was little to no correlation between the two. Many of the countries with extremely low availability of medicines still have some of the lowest rates of HIV, this is seen in countries like India and the Philippines. While there are many countries that have high availability and have a low HIV, there are still countries like Zambia or Uganda with higher rates of medicine availability but still relatively high rates of HIV. Due to these findings we can say that there is likely not any correlation between HIV prevalence and availability of generic medicines.
- For our final research question we were not able to draw any meaningful questions due to the smaller size of our group and limitations in the data. So because of these limitations we were not able to draw any conclusions in regards to any correlations between availability of generic medicines and health expenditure.


## **Discussion**
- Using the data in Chart 1, we were able to observe that the countries with the highest HIV prevalence among adults aged 15 to 49 all were the countries that spent the least in current health expenditure. This is important because it establishes a correlation between the lowest spenders and the highest HIV rates. Every country that spent more than 1000 USD per capita saw HIV prevalence rates lower than 5%. It is clear that the countries who invest properly in their citizens’ health see low HIV prevalence rates, with first world countries like the United States, Switzerland, Norway, and Iceland leading the world in health expenditure spending and having some of the lowest HIV prevalence globally. All of the countries with the HIV rates above 10% spent on average 288 USD per capita, whereas the countries with low rates spent thousands and thousands of dollars per capita.
- We found that the data in Chart 2 did not produce any reliable correlations between median availability of generic medicines and median prevalence of HIV in the years 2007 through 2013. Initially as we were deciding to research this topic we inferred that countries who had the most available generic medicine would have the lowest HIV prevalence, but this was not always the case. There were many countries that had a low median availability of generic medicine but still had low HIV prevalence rates, and vice versa. For example, a country like India has a 2.8% median generic medicine availability and roughly 2.5% median prevalence of HIV, but a country like Malawi had a much higher median generic medicine availability at 55.6% but also a higher median HIV prevalence at around 12.5%. This means that there isn't enough evidence to support the theory that there is a connection between the two variables.


## **Conclusion**
- With the costs of medicine and the availability of treatments increasing at their own respective rates, future outlooks of viruses such as HIV are mixed. From the analysis preformed, there seems to hold consistency between the relation of current health expenditure and the prevalence of the virus in each country, suggesting that countries that have the ability to allocate funds towards the health of their citizens may also decrease the viruses present. However, the analysis included information regarding only one specific virus and a more holistic review would be necessary to conclude meaningful assertions. However, if the conclusion from this analysis holds constant with those in the future, it may draw urgency for countries who are not able to, or don’t prioritize health expenditures within their populations. There are many contributors to why certain countries may currently experience low health expenditures, and analysis such as the one preformed may suggest them to reorganize their allocation of funds in order to decrease the prevalence of infections within their borders. It would be very important to analyze how the increasing costs of medicine will affect the availability of general drugs to the public in countries with low health expenditures. Many citizens are forced out of treatments as a result of their finical statuses, which may suggest that the raising cost of care, coupled with a country’s low health expenditure, may cause for a dramatic increase in prevalence of certain viruses, such as HIV which was shown in the analysis.
- Moving forward, a multitude of factors need to be constantly monitored in order to protect the health of the citizens within each country. Analysis regarding the rates of availability, prevalence of viruses, and allocation of funds should be constantly performed to ensure that citizens are provided with treatments and prevention procedures. Countries that are keeping their virus prevalence rates low and have a surplus of medicine available should find ways to positively contribute to countries which are struggling to allocate funds for the health of their citizens. Overall, the analysis performed suggests that there hold some correlations between these variables and that constant and expanded monitoring should continue in the future to protect the health of citizens worldwide.


#### **Acknowledgements**
- We would like to thank the teaching team of INFO 201 for providing us the meaningful information needed to formulate such a project. This quarter was taught very well and we feel that the material put forward by the teaching team was well received by us students.

## **References**

Bein, M., & Coker-Farrell, E. Y. (2020, March). The association between medical spending     and health status: A study of selected African countries. Malawi medical journal : the journal of Medical Association of Malawi. Retrieved October 31, 2022, from [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7366161/](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7366161/)

Public health and the U.S. economy. News. (2014, February 19). Retrieved October 31, 2022, from [https://www.hsph.harvard.edu/news/magazine/public-health-economy-election/](https://www.hsph.harvard.edu/news/magazine/public-health-economy-election/)

World Health Organization. (n.d.). Declaration of Alma-Ata. World Health Organization. Retrieved October 31, 2022, from [https://www.who.int/teams/social-determinants-of-health/declaration-of-alma-ata](https://www.who.int/teams/social-determinants-of-health/declaration-of-alma-ata)

World Health Organization. (2021). Gho | by category | current health expenditure (che) per capita in US$ - data by country. World Health Organization. Retrieved from [https://apps.who.int/gho/data/view.main.GHEDCHEpcUSSHA2011v?lang=en](https://apps.who.int/gho/data/view.main.GHEDCHEpcUSSHA2011v?lang=en)

World Health Organization. (2021). Gho | by category | median availability of selected generic medicines - data by country. World Health Organization. Retrieved from [https://apps.who.int/gho/data/node.main.488?lang=en](https://apps.who.int/gho/data/node.main.488?lang=en)

World Health Organization. (2021). Gho | by category | prevalence of HIV among adults aged 15 to 49 - estimates by country. World Health Organization. Retrieved from [https://apps.who.int/gho/data/view.main.22500?lang=en](https://apps.who.int/gho/data/view.main.22500?lang=en)

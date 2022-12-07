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

- **Citations:**
  - Bein, M., & Coker-Farrell, E. Y. (2020, March). The association between medical spending and health status: A study of selected African countries. Malawi medical journal : the journal of Medical Association of Malawi. Retrieved October 31, 2022, from https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7366161/
  - Public health and the U.S. economy. News. (2014, February 19). Retrieved October 31, 2022, from https://www.hsph.harvard.edu/news/magazine/public-health-economy-election/
  - World Health Organization. (n.d.). Declaration of Alma-Ata. World Health Organization. Retrieved October 31, 2022, from https://www.who.int/teams/social-determinants-of-health/declaration-of-alma-ata

## **Research Questions**
- Our first research question is to address if there is a connection between health expenditure and availability of generic medicines, specifically, is there a positive correlation between health expenditure per capita and availability of generic medicines? Answering this question would allow us to gain a better understanding of the impact that expenditure has on not just availability of medicines but by extension health as a whole.

- Next, we will connect the ideas of health expenditure and apply it to the case of HIV. Through this connection we will answer the question, does higher expenditure of a country per capita have any effect or correlation with prevalence of HIV within a country's population? This question allows us to see the direct effect that expenditure has on the prevalence of HIV and possibly other viruses and diseases.

- Finally, we will connect the ideas of availability of generic medicines to HIV also. This will allow us to address the question, does availability of generic medicines, and in turn the ability to treat HIV, within a countries population affect how prevalent HIV is within a target countries population?


## **The Dataset**
- **Current Health Expenditure (CHE) per Capita in US$: Data by Country**
  - This dataset contains information regarding the health expenditure per capita in USD for 192 different countries around the world. This dataset will help our project team analyze the allocation of money towards healthcare in different countries and see if any discrepancies between funding and accessibility to medicine or prevalence of HIV exits.

      | Name         | Observations | Variables |
      |--------------|--------------|-----------|
      | CHE_data.csv | 192          | 20        |

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

      | Name         | Observations | Variables |
      |--------------|--------------|-----------|
      | med_aval.csv |  37          |  2        |

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

      | Name         | Observations | Variables |
      |--------------|--------------|-----------|
      | prev_hiv.csv | 194          | 22        |

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
Assuming you answer your research questions, briefly describe the expected or possible implications for technologists, designers, and policymakers.

![che_dataset](che_dataset.PNG)

"""
(TODO FINAL PROJECT)
"""

## **Discussion**
"""
(TODO FINAL PROJECT)
"""

## **Conclusion**
"""
(TODO FINAL PROJECT)
"""

#### **Acknowledgements**
| Is there anyone you would like to thank? A librarian who helped you with your research? A Teaching Assistant? A friend who helped you find your data? Say thank you in this section.

"""
(TODO FINAL PROJECT)
"""

## **References**
References  Include citations to your three references. See 2.0 Introduction. If you like, you can cite more than three references.  Please use a standard citation style of your choice.  See [Citing Sources](https://guides.lib.uw.edu/research/citations) at the UW Library

"""
(TODO FINAL PROJECT)
"""

## **Appendix A**
"""
(TODO FINAL PROJECT)
"""

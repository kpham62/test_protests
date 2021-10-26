# Assignment 1: Protests
The past few years in the United States, there has been a surge in protests in support of Black Lives Matter, gender equity, and other social issues. In this assignment, you'll work with data from [CountLove](https://countlove.org/) -- the same data often [cited](https://www.nytimes.com/2020/08/28/us/black-lives-matter-protest.html) by the New York Times -- to learn more about demonstrations over the past few years.

By completing the assignment, you will demonstrate the following skills:

- Use of **version control** for managing your code
- Declaring document rendering using **markdown** syntax
- Foundational programming skills in R.


## Background Research
Before diving into this (or any) dataset, it's important to have _domain familiarity_ (i.e., to know something about the topic). As preparation, I'm asking that you read **three articles** about protests in the U.S., and provide a brief 1 - 2 sentence summary or takeaway from each one.

In the section below, create an **unordered list** of the three articles you found. Make sure to provide an appropriate markdown link (_not_ just the URL) to the article in addition to your 1 - 2 sentence summary.

- [Black Lives Matter May Be the Largest Movement in U.S. History](https://www.nytimes.com/interactive/2020/07/03/us/george-floyd-protests-crowd-size.html) - This article analyzes why the attendance of George Floyd & Black Lives Matter protests were one of the largest we've seen for a protest. Combined with changing societal ideologies, the pandemic gave everyone the free time to do so.
- [U.S. Saw Summer of Black Lives Matter Protests Demanding Change](https://www.usnews.com/news/top-news/articles/2020-12-07/us-saw-summer-of-black-lives-matter-protests-demanding-change) - This article details actions taken by groups around the U.S. to stand in solidarity with the Black Lives Matter protests. A significant example includes the National Basketball Association (NBA) and Women's NBA games being postponed in solidarity with the demonstrators, followed by Major League Baseball and Major League Soccer.
- [Did Last Summer’s Black Lives Matter Protests Change Anything?](https://www.newyorker.com/news/our-columnists/did-last-summers-protests-change-anything) - This article compares the differences in gestures made by corporations in support of the Black Lives Matter movement and actual systematic changes. Although there are minimal changes compared to what was asked of the government and their subsidiaries, there is now widespread agreement that racism has been embedded in the public and private institutions that govern our lives and dictate our access to services, justifying the demands for specific actions to undo the harmful results.

## Accompanying Image
In this section, please **display one image** to accompany your text, and describe _why_ you included it (~2 - 3 sentences). This will require that you download an image into your project folder. In your description, use **bold** and _italics_ (at least once, for practice) to emphasize some of your points.


I included this image because it emphasizes the similarities in the struggle for **racial equality** and **civil rights** throughout time. Although, this struggle has been going on for much longer than since the 1960s -- the reality is that black people have been challenging white supremacist violence for _much over a century_. I believe this image is an important starting point for discussion on how racial inequality has been ingrained into the DNA of the U.S. and how we can make change in spite of it.

## Analysis
At this point, you should open up your `analysis.R` script to begin working with the data. The script will guide you through an initial analysis of the data. Throughout the script, there are prompts labeled **Reflection**. Please write 1 - 2 sentences for each of these reflections below:

- What does the difference between the mean and the median tell you about the *distribution* of the data?

There is a **large** difference between the mean and median of the number of attendees. When the mean is greater than the median (in this case, mean = 643.8831, median = 100), the distribution is positively skewed; distribution in which most values are clustered around the left tail of the distribution while the right tail of the distribution is longer (number of attendees bent towards the lower side).

- Does the number of protests in Washington surprise you? Why or why not?

1375 protests (while making up about 13.7% of all protests on the data set) is a lot, and for me it's unsurprising. Washington is generally a liberal state, especially in urban areas, so progressive movements are not unfamiliar with the state's citizens (including me who also protested).

- Looking at the `state_table` variable, what data quality issues do you notice, and how would you use that to change your analysis (no need to actually change your analysis)?

The biggest quality issues I've noticed is the consideration of both upper and lower case characters as different state entities (e.g. WA and wA). This creates a misrepresentation of the actual unique "states" and in my analysis, I would only consider fully capitalized abbreviations and their connected values as states.

- Does the change in the number of protests from 2019 to 2020 surprise you? Why or why not?

The difference in protests isn't surprising at all, 2020 is the year of the climax of the pandemic and also when the George Floyd protests began -- adding a significant number to the total alone. Additionally, the George Floyd protests were a large motivator to all proceeding protests for black civil rights in 2020.

- Do a bit of research. Find at least *two specific policies* that have been changed as a result of protests in 2020. These may be at the city, state, or University level. Please provide a basic summary, as well as a link to each article.

1. **Landmark Policing Reform Law**: Signed by Gov. Charlie Baker on December 31, 2020 for Massachusetts in response to thee George Floyd protests, the law puts some guardrails around law enforcement's use of force, prohibiting the use of chokeholds, requiring the use of de-escalation tactics before physical force, and establishing limits on the use of rubber bullets, tear gas and dogs. It also requires that an officer intervene in most situations if he or she sees another officer using unnecessary physical force and to report that use of force up the chain of command.

2. **Reimagine LA County**: In response to the George Floyd and Breonna Taylor protests, Los Angeles voters voted majority for Measure J (Reimagine LA County) which requires that 10 percent of the city’s unrestricted general funds — estimated between $360 million and $900 million per year — be invested in social services and alternatives to incarceration, not prisons and policing. Essentially, defunding the police through the avenue of this policy which the Los Angeles County Board of Supervisors approved placing the measure on the ballot by a vote of 4-1 in early August, 2020.

- Take a look (`View()`) your `high_level_table` variable. What picture does this paint of the U.S.?

It tells us that the U.S., in terms of purpose for protests, are largely focused on racial injustice, which outnumbers every other category by at least around double. It paints the U.S. as a country that still has significant issues reaching agreement on solving racial injustices between the government and its people.

## Final Thoughts
When you are finished, with your analysis, please answer the following questions in 1-2 sentences each.

- What about the analysis surprised you?

What surprised me about the analysis was how little data means when unformatted or organized. After working through organizing the data and finding the mins, maxes, etc., it ended up revealing patterns that would have otherwise been overlooked.

- What parts of this analysis did you find challenging?

I found almost every part of the analysis challenging, especially the sections that required new applications of commands that were not covered in the lecture exercises. It took a long time, but once I found out how to properly format these commands and all their subsidiary variables, it easily stuck into my memory.

- What types of analysis do you wish you were able to do with the dataset, but currently don't have the technical skills to do?

I wish I was able to customize a graph, including its x and y axis to get a more accurate visual view of the data. Furthermore, using the data to create even more types of graphs such as the bar graph.

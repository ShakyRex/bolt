# bolt
## Part 1
### Files submitted
bolt_erd.pdf is the entity relationship diagram itself
bolt_erd_create.txt is the file used to create the erd, which also includes notes and explains the nature of the relations between tables

source_test.sql contains the generic tests to run on the sources in dbt
customer_tests.sql contains a singular test for the customer table to run in dbt. The logic here was that at least one contact means for the customer needed to be present.

looker_views_explore.txt contains the lookml code to create views based on the source tables and the code to create an explore that brings together the sources following the same logic shown in the dbt

### additional context on why you have designed such a data model
The design of the model follows classic normalization principles, not repeating data, which makes it efficient in terms of storage. This design makes it also easy to scale, by adding new planes, trips, and so on. It's also quite intuitive.

Not knowing much about the business context and about how the data is produced, the following decision might seem a bit arbitrary. However, I decided to build a pipeline that flags issues related to data quality leveraging DBT rather than blocking the ingestion with constraints applied to the tables.
This approach was for sure influenced by my newly acquired dbt fundamentals certification.

### comments on what would you do if you had more time for the task
- The first thing I would do, having more time for the task, is to gather more context about the business and technical setup, in particular about the data production process and the needs of the stakeholders at the end of the pipeline. This knowledge might have led to different choices, mostly around whether to enforce constraints at the database level or to keep the tests in dbt. 
- This would have also given me a better idea of what metrics are needed in Looker, and it would have helped in considering future scenarios and edge cases.
- I would have also added 2 more singular tests for the customer table, using regex to make sure that the email addresses are actually email addresses and that the phone numbers are phone numbers (trickier since the length of phone numbers varies a lot globally). 
- I would have addressed the json aeroplane file ingestion through a python script. 
- I would have also set up the freshness parameters in dbt.
- And lastly, I would have addressed possible data GDPR concerns about keeping non-anonymized customer data.

## Part 2
### How would you envision the ideal CI/CD process to implement these changes over time? What kind of environments, processes, tests, and tools might be involved?
It looks like DBT allows for scaling the business logic without drastic changes, so I would focus mostly on data accuracy, introducing automated tests at every push and code review practices.

### How would your answer differ in the real-world use case where resources are limited and perfect tooling might not be available? What are some of the low effort/short term and high effort/long term things you would suggest we implement?
In order to ensure data quality in the face of limited resources, a very low-effort solution is to build dashboards that flag suspicious entries and make the team or person responsible for that process also in charge of data quality. This, in my experience, works if the data team is very small and with little capacity left. A more long-term solution would be to create bots that ping in Slack (or whatever equivalent) the data owner in case of an anomaly. This makes the data check a reactive effort instead of proactive, which calls for less effort. This lends itself well also when the data source originates from manual input (what a nightmare).

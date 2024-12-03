# bolt

## Part 1
### Files submitted
bolt_erd.pdf is the entity relationship diagram itself 
bolt_erd_create.txt is the file used to create the erd, which also includes notes and explains the nature of the relations between tables

source_test.sql contains the generic tests to run on the sources in dbt 
customer_tests.sql contains a singular test for the customer table to run in dbt. The logic here was that at least one contact mean for customer needed to be present. 

looker_views_explore.txt contains the lookml code to create views based on the source tables and the code to create an explore that brings together the sources following the same logic shown in the dbt

### additional context on why you have designed such a data model
The design of the model follows classic normalization principles not repeating data, which makes it efficient in term of storage. This design makes it also easy to scale, by adding new planes, trips and so on. It's also quite intuitive. 

Not knowing much about the business context and about how the data is produced, the following decision might seem a bit arbitrary, however I decided to build a pipeline that flags issues related to data quality leveraging DBT rather than blocking the ingestion with constraints applied to the tables. 
This approach for for sure influenced by my newly aquired [dbt fundamentals certification](https://credentials.getdbt.com/bd4ea664-a948-4be4-91c3-d04e58978784#acc.ay7dBnxT)

### comments on what would you do if you had more time for the task
The first thing I would do having more time for the task is to gather more context about the business and technical setup, in particular about the data production process and the needs of the stakeholders at the end of the pipeline. This knowledge might have lead to different choices mostly around whether to enforce constraints at the database level or to keep the tests in dbt. This would have also given me the a better idea of what metrics are needed in looker. And lastly it would have helped in considering future scenarios and edge cases. 
Jobs to in dbt. 
Lastly I would have also added 2 more singluar tests for the customer table, using regex to make sure that the email addresses are actually email addresses and that the phone numbers are phone numbers (trickier since the length of phone numbers varies a lot globally). 


## Part 2
### How would you envision the ideal CI/CD process to implement these changes over time? What kind of environments, processes, tests and tools might be involved?
code review 

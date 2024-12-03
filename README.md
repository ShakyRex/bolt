# bolt

## Part 1
### Files submitted
bolt_erd.pdf is the entity relationship diagram itself 
bolt_erd_create.txt is the file used to create the erd, which also includes notes and explains the nature of the relations between tables

source_test.sql contains the generic tests to run on the sources in dbt 
customer_tests.sql contains a singular test for the customer table to run in dbt. The logic here was that at least one contact mean for customer needed to be present. 

looker_views_explore.txt contains the lookml code to create views based on the source tables and the code to create an explore that brings together the sources following the same logic shown in the dbt

### additional context on why you have designed such a data model

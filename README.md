# Smalldoor test  
  
Hello, This is the app I have done for the test. I build the app with PostgreSQL in database. 
  
## Requirements  
* ruby 2.6.3p62  
* psql (PostgreSQL) 11.0  
  
## Dependencies  
  
```bash  
bundle install  
```  
  
## Database creation  
  
```bash  
bundle exec rake db:create  
bundle exec rake db:migrate  
```  

The database was created in `smalldoor_dev` for development and `smalldoor_test` for the test
## Database seed

```bash  
bundle exec rake db:seed  
```  
## Model
There are 3 models and 2 joins tables for the data application model
- Member
- MembershipPlan
- Procedure

- ProcedureMembership : this join table for admins to store the fact that procedure_id is included n times per year in the given membership_plan
- MemberActivity : this join table for admins to store the fact that the member's activity history based on the procedures they underwent 
## Run 
  
### addProcedureToMembership  
  
```bash  
rake add_procedure_to_membership membership_id=[value] procedure_id=[value] n=[value]  
 ```  
### calculate_invoice  
  
```bash  
rake calculate_invoice member_id=[value] procedure_ids=[Array[]]
 ```  
For exemple:   
  
```bash  
rake add_procedure_to_membership membership_id=1 procedure_id=1 n=3  
 ```  
  
```bash  
rake calculate_invoice member_id=1 procedure_ids=[1,2,3]   
 ```  

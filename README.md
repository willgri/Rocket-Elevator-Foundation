# Week 8

### Working the exposition of services with APIs

## API technologies

-REST
-GraphQL

	
## Program List

- Framework : Rails
- Database used : MySQL and PostgreSQL
- Deployed with : Capistrano
- Gem used for Login and Admin pages : Devise and Rails_admin
- Gem used for Graph : Chartjs-ror
- Gem used for Schedule : Whenever
- Gem used for GraphQL technologie :"graphql" & 'graphiql-rails'


## Programming Language used

- Javascript
- HTML
- CSS
- Ruby
- SQL

## Collaborators :

- Stephane Roy
- Danny Gauthier
- Dominic Villemure
- Simon Fortier
- William Grimard

## GRAPHQL QUERIES 

### query #1
```
query{
  interventionInfo(id: 10){
    id
    startInterventionDateHour
    endInterventionDateHour
    building{
      address{
        addressType
        country
        city
        adress
        appartment
        postalCode
        notes        
      }
    }
  }
}
```

### query #2

```
query{
  buildingInfo(id: 10){
    id
    customer{
      id
      fullName
      businessName
      email
      phoneNumber
      address{
        country
        city
        adress
        appartment
        postalCode
        notes
      }
    }
    interventions {
      id
      columnId
      elevatorId
      startInterventionDateHour
      endInterventionDateHour
      result
      report
      status     
    }
  }
}
```

### query #3

```
query{
  employeeInfo(id: 500){
    id
    interventions {
      id
      batteryId
      columnId
      elevatorId
      startInterventionDateHour
      endInterventionDateHour
      result
      status
      report
      building{
        id
        buildingAdminFullName
        buildingAdminEmail
        buildingAdminPhoneNumber
        technicalRessourceFullName
        technicalRessourceEmail
        technicalRessourcePhoneNumber
        address {
          id
        }
        customer {
          id
        }
        BuildingDetails {
          id
          informationKey
          value
        }
      }    
    }
  }
}
```

<!-- ABOUT THE PROJECT -->
## About The Project

It is a simple project of a hotel chain data warehouse, with a simple gui, implemented data mining algorithm from the weka library.

### Built With
* [Java 11](https://www.java.com/pl/download/)
* [JavaFX](https://docs.oracle.com/javafx/2/layout/builtin_layouts.htm)
* [PostgreSQL](https://www.postgresql.org)
* [WEKA](https://www.cs.waikato.ac.nz/~ml/weka/)



<!-- GETTING STARTED -->
## Getting Started



### Prerequisites

* Eclipse, NetBeans, or IntelliJ IDEA
* Docker

### Installation

<span>1.</span> Clone this repo<br/>
```
git clone https://github.com/lokyiec/HotelsDataWarehouse.git
```
<span>2.</span> Go to pgdatabase and run command
```
docker-compose up -d
```
<span>3.</span> Run command
```
cat database.sql | docker exec -i {docker-postgres-container} psql -U {user} -d {database_name}
```
<span>4.</span> Open project in your IDE and run.




<!-- LICENSE -->
## License

Distributed under the MIT License.







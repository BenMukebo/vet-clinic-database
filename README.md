![](https://img.shields.io/badge/Microverse-blueviolet)

# Vet clinic database

## Description

> Use a relational database to create the data structure for a vet clinic.

## Learning objectives
- Build a relational database based on a real-life example.
- Create tables in SQL.
- Insert and query data in SQL.
- Use database transactions.
- Modify and delete data in SQL.
- Prepare complex queries that answer analytical questions.
- Use primary key & foreign key mechanism for joining tables.
- Query multiple tables.
- Prepare complex queries that answer analytical questions.
- Understand the different types of relationships between tables.
- Prepare complex queries that answer analytical questions.
- Use primary key & foreign key mechanism for joining tables.
- Understand what can impact database performance.
- 


## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**


## Install

- To install PostgreSQL, first refresh your server’s local package index:

```bash
$  sudo apt update
```
  
- Then, install the Postgres package along with a -contrib package that adds some additional utilities and functionality:

```bash
$   sudo apt install postgresql postgresql-contrib
```

## Usage

```bash
$  sudo -u postgres psql
```
  
```bash
$   \q   or   $   exit
```
  
```bash
$  \c <vet_clinic>
```

## Built With

This project is build with:

-  ![Postgre](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

## Authors

👤 **Ben Mukebo**

- GitHub: [@BenMukebo](https://github.com/BenMukebo)
- Twitter [@BenMukebo](https://twitter.com/BenMukebo)
- LinkedIn [BenMukebo](https://www.linkedin.com/in/kasongo-mukebo-ben-591720205/)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/BenMukebo/vet-clinic-database/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./MIT.md) licensed.

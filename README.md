# Airbnb Data Analysis with dbt

This project uses dbt (Data Build Tool) to transform and analyze Airbnb listings and reviews data. The project includes models for data aggregation and analysis.

## Project Structure

```plaintext
├── models/
│   ├── stg_listings.sql
│   ├── stg_reviews.sql
│   ├── listings_aggregates.sql
│   ├── room_type_aggregates.sql
├── analyses/
│   └── identify_missing_values.sql
├── schemas/
│   └── schema.yml
├── dbt_project.yml
├── README.md
```

### Models

- `stg_listings.sql`: Staging model for listings data.
- `stg_reviews.sql`: Staging model for reviews data.
- `listings_aggregates.sql`: Model that performs aggregations on listings and reviews data.
- `room_type_aggregates.sql`: Model that performs aggregations by room type and neighborhood.

### Analyses

- `identify_missing_values.sql`: SQL script to identify missing values in the staging tables.

### Schema

- `schema.yml`: Defines tests for the source tables and models.

## Setup

1. **Clone the repository:**
    ```sh
    git clone <repository_url>
    cd <repository_directory>
    ```

2. **Install dbt:**
    ```sh
    pip install dbt
    ```

3. **Set up your dbt profile:**
    Create a `profiles.yml` file in the `~/.dbt/` directory with the following content:
    ```yaml
    airbnb:
      target: dev
      outputs:
        dev:
          type: snowflake
          account: <your_account>
          user: <your_username>
          password: <your_password>
          role: <your_role>
          database: <your_database>
          warehouse: <your_warehouse>
          schema: dev
          threads: 4
    ```

4. **Run dbt:**
    ```sh
    dbt run
    ```

5. **Run tests:**
    ```sh
    dbt test
    ```

## Usage

- To run the models and create the transformed tables/views, use:
    ```sh
    dbt run
    ```

- To test the models, use:
    ```sh
    dbt test
    ```

- To generate documentation, use:
    ```sh
    dbt docs generate
    ```

- To serve the documentation, use:
    ```sh
    dbt docs serve
    ```

## Models

### `stg_listings.sql`
Staging model for the `listings` table from the source data.

### `stg_reviews.sql`
Staging model for the `reviews` table from the source data.

### `listings_aggregates.sql`
Aggregates listings and reviews data to calculate the average price and total reviews by neighborhood.

### `room_type_aggregates.sql`
Aggregates listings data to calculate the average price, total listings, and average availability by room type and neighborhood.

## Analyses

### `identify_missing_values.sql`
Identifies missing values in the `stg_listings` and `stg_reviews` tables.

## Customizing

You can customize the models and analyses to fit your specific needs. Modify the SQL scripts in the `models` and `analyses` directories as needed.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Contributions

Contributions are welcome! Please create a pull request or open an issue to discuss the changes.

## Contact

For any questions or issues, please contact [Abhijeet Singh] at [singhmanchu09@gmail.com].


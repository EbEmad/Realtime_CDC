CREATE TABLE IF NOT EXISTS people(
    id int PRIMARY KEY,
    name VARCHAR(20),
    age int,
    hobby varchar(30),
    inserted_at TIMESTAMP
);

CREATE OR REPLACE FUNCTION set_modified_on_insert()
RETURNS TRIGGER AS $$
BEGIN
    NEW.inserted_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER people_insert_trigger
BEFORE INSERT ON people
FOR EACH ROW
EXECUTE FUNCTION set_modified_on_insert();
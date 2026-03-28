-- +goose Up
CREATE TABLE photo (
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT,
    taken_at TIMESTAMP,
    created_at TIMESTAMP
);


-- +goose Down
DROP TABLE photo;

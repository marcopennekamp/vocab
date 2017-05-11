-- :name create-user! :! :n
-- :doc creates a new user record
INSERT INTO users (name, email, password)
VALUES (:name, :email, :password);

-- :name get-user :? :1
-- :doc retrieve a user given the id.
SELECT * FROM users
WHERE id = :id;

-- :name delete-user! :! :n
-- :doc delete a user given the id
DELETE FROM users
WHERE id = :id;

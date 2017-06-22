-- :name create-account! :! :n
-- :doc creates a new account
INSERT INTO account (name, email, password)
VALUES (:name, :email, :password);

-- :name get-account :? :1
-- :doc retrieve an account given the id.
SELECT * FROM account
WHERE id = :id;

-- :name delete-account! :! :n
-- :doc delete an account given the id
DELETE FROM account
WHERE id = :id;

SELECT clients.first_name, clients.last_name, billing.amount, billing.charged_datetime
FROM clients
JOIN billing ON clients.id = billing.clients_id;

SELECT 
    clients.first_name, clients.last_name, sites.domain_name
FROM
    clients
        LEFT JOIN
    sites ON clients.id = sites.clients_id;

SELECT clients.first_name, clients.last_name, SUM(billing.amount)
FROM clients
JOIN billing ON clients.id = billing.clients_id
GROUP BY clients.id;

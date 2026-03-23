<?php

require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/db_connection.php';

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

$app = AppFactory::create();
$app->addBodyParsingMiddleware();

$app->get('/users', function (Request $req, Response $res) use ($pdo) {
    $users = $pdo->query("SELECT * FROM users")->fetchAll(PDO::FETCH_ASSOC);
    $res->getBody()->write(json_encode($users));
    return $res->withHeader('Content-Type', 'application/json');
});

$app->get('/users/{id}', function (Request $req, Response $res, $args) use ($pdo) {
    $stmt = $pdo->prepare("SELECT * FROM users WHERE id = ?");
    $stmt->execute([$args['id']]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$user) {
        $res->getBody()->write(json_encode(['error' => 'User not found']));
        return $res->withStatus(404)->withHeader('Content-Type', 'application/json');
    }
    $res->getBody()->write(json_encode($user));
    return $res->withHeader('Content-Type', 'application/json');
});

$app->post('/users', function (Request $req, Response $res) use ($pdo) {
    $data = $req->getParsedBody();
    $pdo->prepare("INSERT INTO users (name,email,password) VALUES (?,?,?)")
        ->execute([$data['name'], $data['email'], $data['password']]);
    $res->getBody()->write(json_encode(['message' => 'User created']));
    return $res->withHeader('Content-Type', 'application/json');
});

$app->put('/users/{id}', function (Request $req, Response $res, $args) use ($pdo) {
    $data = $req->getParsedBody();
    $pdo->prepare("UPDATE users SET name=?, email=?, password=? WHERE id=?")
        ->execute([$data['name'], $data['email'], $data['password'], $args['id']]);
    $res->getBody()->write(json_encode(['message' => 'User updated']));
    return $res->withHeader('Content-Type', 'application/json');
});

$app->delete('/users/{id}', function (Request $req, Response $res, $args) use ($pdo) {
    $pdo->prepare("DELETE FROM users WHERE id=?")->execute([$args['id']]);
    return $res->withStatus(204);
});

$app->run();
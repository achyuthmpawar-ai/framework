<?php
require __DIR__ . '/vendor/autoload.php';
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

$app = AppFactory::create();
$app->addBodyParsingMiddleware();
$app->setBasePath('/fwproject');

$host = "localhost";
$username = "root";
$password = "";
$database = "csci6040_study";

$con = mysqli_connect($host, $username, $password, $database);
if (!$con) {
    die("Database connection failed: " . mysqli_connect_error());
}

// GET single user using query parameter ?id=1
$app->get('/', function (Request $request, Response $response) use ($con) {
    $params = $request->getQueryParams();
    if (!isset($params['id'])) {
        $response->getBody()->write("Error: ID is required");
        return $response->withStatus(400)->withHeader('Content-Type', 'text/plain');
    }

    $id = intval($params['id']);
    $stmt = mysqli_prepare($con, "SELECT * FROM users WHERE id = ?");
    mysqli_stmt_bind_param($stmt, "i", $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $user = mysqli_fetch_assoc($result);

    if (!$user) {
        $response->getBody()->write("Error: User not found");
        return $response->withStatus(404)->withHeader('Content-Type', 'text/plain');
    }

    $output = "ID: {$user['id']}\nName: {$user['name']}\nEmail: {$user['email']}\nPassword: {$user['password']}";
    $response->getBody()->write($output);
    return $response->withHeader('Content-Type', 'text/plain');
});

// POST create user
$app->post('/', function (Request $request, Response $response) use ($con) {
    $data = $request->getParsedBody();
    $name = $data['name'] ?? '';
    $email = $data['email'] ?? '';
    $password = $data['password'] ?? '';

    $stmt = mysqli_prepare($con, "INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
    mysqli_stmt_bind_param($stmt, "sss", $name, $email, $password);
    mysqli_stmt_execute($stmt);

    $response->getBody()->write("Inserted ID: " . mysqli_insert_id($con));
    return $response->withHeader('Content-Type', 'text/plain');
});

// PUT update user
$app->put('/', function (Request $request, Response $response) use ($con) {
    $data = $request->getParsedBody();
    if (!isset($data['id'])) {
        $response->getBody()->write("Error: ID is required for update");
        return $response->withStatus(400)->withHeader('Content-Type', 'text/plain');
    }

    $id = intval($data['id']);
    $name = $data['name'] ?? '';
    $email = $data['email'] ?? '';
    $password = $data['password'] ?? '';

    $stmt = mysqli_prepare($con, "UPDATE users SET name=?, email=?, password=? WHERE id=?");
    mysqli_stmt_bind_param($stmt, "sssi", $name, $email, $password, $id);
    mysqli_stmt_execute($stmt);

    $response->getBody()->write("User ID {$id} updated successfully");
    return $response->withHeader('Content-Type', 'text/plain');
});

$app->delete('/', function (Request $request, Response $response) use ($con) {
    $data = $request->getParsedBody();
    if (!isset($data['id'])) {
        $response->getBody()->write("Error: ID is required for delete");
        return $response->withStatus(400)->withHeader('Content-Type', 'text/plain');
    }

    $id = intval($data['id']);
    $stmt = mysqli_prepare($con, "DELETE FROM users WHERE id=?");
    mysqli_stmt_bind_param($stmt, "i", $id);
    mysqli_stmt_execute($stmt);

    $response->getBody()->write("User ID {$id} deleted successfully");
    return $response->withHeader('Content-Type', 'text/plain');
});

$app->run();
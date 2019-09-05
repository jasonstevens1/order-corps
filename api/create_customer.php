<?php
// required headers
header("Access-Control-Allow-Origin: http://localhost/order_corps/");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// files needed to connect to database
include_once 'config/database.php';
include_once 'objects/customer.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// instantiate product object
$customer = new Customer($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// set product property values
$customer->firstname = $data->firstname;
$customer->lastname = $data->lastname;
$customer->email = $data->email;
$customer->password = $data->password;
 
// create the customer
if(
    !empty($customer->firstname) &&
    !empty($customer->email) &&
    !empty($customer->password) &&
    $customer->create()
){
 
    // set response code
    http_response_code(200);
 
    // display message: customer was created
    echo json_encode(array("message" => "Customer was created."));
}
 
// message if unable to create customer
else{
 
    // set response code
    http_response_code(400);
 
    // display message: unable to create customer
    echo json_encode(array("message" => "Unable to create customer."));
}
?>

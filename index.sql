<!----------------------------TASK-01------------------------>
<?php
global $con;
include 'connector.php';
echo "<h1>Task-01</h1> <br>";

$sql = "
    SELECT Customers.customer_id, Customers.name, Customers.email, Customers.location, Customers.location, COUNT(Orders.order_id) as total_orders
    FROM Customers
    LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
    GROUP BY Customers.customer_id, Customers.name, Customers.email, Customers.location
    ORDER BY total_orders DESC;
";


$result = mysqli_query($con, $sql);

if ($result->num_rows > 0) {
    // Display the results in a table
    echo "<table  border='1'>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Location</th>
                <th>Total Orders</th>
            </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row["customer_id"] . "</td>
                <td>" . $row["name"] . "</td>
                <td>" . $row["email"] . "</td>
                <td>" . $row["location"] . "</td>
                <td>" . $row["total_orders"] . "</td>
            </tr>";
    }

    echo "</table>";
} else {
    echo "No results found.";
}

// Close the database connection
$con->close();
echo"<br>";
echo "-------------------------------------------------------------------------------------<br>
-------------------------------------------------------------------------------------";
echo"<br>";

?>

<!----------------------------TASK-02------------------------>

<?php
global $con;
include 'connector.php';
echo "<h1>Task-02</h1> <br>";

$sql = "
    SELECT Orders.order_id, Products.name AS product_name, Order_Items.quantity, (Order_Items.unit_price * Order_Items.quantity) AS total_amount
    FROM Orders
    INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id
    INNER JOIN Products ON Order_Items.product_id = Products.product_id
    ORDER BY Orders.order_id ASC;
";

$result = mysqli_query($con, $sql);

if(!$result){
    die(mysqli_error($con));
}

if ($result->num_rows > 0) {
    // Display the results in a table
    echo "<table  border='1'>
            <tr>
                <th>Order ID</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Total Amount</th>
            </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr >
                <td>" . $row["order_id"] . "</td>
                <td>" . $row["product_name"] . "</td>
                <td>" . $row["quantity"] . "</td>
                <td>" . $row["total_amount"] . "</td>
            </tr>";
    }

    echo "</table>";
} else {
    echo "No results found.";
}

// Close the database connection
$con->close();

echo"<br>";
echo "-------------------------------------------------------------------------------------<br>
-------------------------------------------------------------------------------------";
echo"<br>";


?>

<!----------------------------TASK-03------------------------>

<?php
global $con;
include 'connector.php';
echo "<h1>Task-03</h1> <br>";


$sql = "
    SELECT Orders.order_id, Products.name AS product_name, Order_Items.quantity, (Order_Items.unit_price * Order_Items.quantity) AS total_amount
    FROM Orders
    INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id
    INNER JOIN Products ON Order_Items.product_id = Products.product_id
    ORDER BY Orders.order_id ASC;
";

$result = mysqli_query($con, $sql);

if(!$result){
    die(mysqli_error($con));
}
if ($result->num_rows > 0) {
    // Display the results in a table
    echo "<table border='1'>
            <tr>
                <th>Order ID</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Total Amount</th>
            </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row["order_id"] . "</td>
                <td>" . $row["product_name"] . "</td>
                <td>" . $row["quantity"] . "</td>
                <td>" . $row["total_amount"] . "</td>
            </tr>";
    }

    echo "</table>";
} else {
    echo "No results found.";
}

// Close the database connection
$con->close();

echo"<br>";
echo "-------------------------------------------------------------------------------------<br>
-------------------------------------------------------------------------------------";
echo"<br>";

?>

<!----------------------------TASK-04------------------------>

<?php

global $con;
include 'connector.php';
echo "<h1>Task-04</h1> <br>";

$sql = "
    SELECT Customers.name, SUM(Order_Items.quantity * Order_Items.unit_price) AS total_purchase_amount
    FROM Customers
    LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
    LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id
    GROUP BY Customers.name
    ORDER BY total_purchase_amount DESC
    LIMIT 5;
";

$result = mysqli_query($con, $sql);

if(!$result){
    die(mysqli_error($con));
}

if ($result->num_rows > 0) {
    // Display the results in a table
    echo "<table border='1'>
            <tr>
                <th>Customer Name</th>
                <th>Total Purchase Amount</th>
            </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row["name"] . "</td>
                <td>" . $row["total_purchase_amount"] . "</td>
            </tr>";
    }

    echo "</table>";
} else {
    echo "No results found.";
}

// Close the database connection
$con->close();
?>

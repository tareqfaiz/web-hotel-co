<?php
include 'header.php'; 
include 'db.php'; 

// Start the session for user management
session_start();

// Initializing variables
$title = '';
$text = '';
$category_id = '';
$author = $_SESSION['user_name'] ?? ''; // Default to logged-in user, if applicable
$error = '';
$user_error = '';
$user_success = '';

// Handle Add Article Submission
if ($_SERVER['REQUEST_METHOD'] === 'POST' && !isset($_POST['add_user'])) {
    $title = $_POST['title'];
    $text = $_POST['text'];
    $category_id = $_POST['category_id'];
    $author = $_POST['author'];

    // Validation
    if (empty($title) || empty($text) || empty($category_id) || empty($author)) {
        $error = 'Please fill in all fields.';
    } else {
        // Check if author exists in the users table
        $user_stmt = $pdo->prepare("SELECT * FROM users WHERE user_name = ?");
        $user_stmt->execute([$author]);
        if (!$user_stmt->fetch()) {
            $error = 'Invalid author username.';
        } else {
            // Prepare SQL statement to insert the article
            $stmt = $pdo->prepare("INSERT INTO articles (title, text, category_id, author, publish_date) VALUES (?, ?, ?, ?, NOW())");
            if ($stmt->execute([$title, $text, $category_id, $author])) {
                echo "<p>Article added successfully!</p>";
                // Reset form fields
                $title = '';
                $text = '';
                $category_id = '';
            } else {
                $errorInfo = $stmt->errorInfo();
                $error = 'Error adding article: ' . $errorInfo[2];
            }
        }
    }
}

// Handle Add User Submission
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_user'])) {
    $user_name = $_POST['user_name'];
    $password = $_POST['password'];
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $role = $_POST['role'];

    // Validation
    if (empty($user_name) || empty($password) || empty($first_name) || empty($last_name) || empty($role)) {
        $user_error = 'Please fill in all fields.';
    } else {
        // Check if username already exists
        $check_user_stmt = $pdo->prepare("SELECT * FROM users WHERE user_name = ?");
        $check_user_stmt->execute([$user_name]);

        if ($check_user_stmt->fetch()) {
            $user_error = 'Username already exists. Please choose another one.';
        } else {
            // Hash the password for security
            $hashed_password = password_hash($password, PASSWORD_BCRYPT);

            // Insert new user into database
            $add_user_stmt = $pdo->prepare("INSERT INTO users (user_name, password, first_name, last_name, role) VALUES (?, ?, ?, ?, ?)");
            if ($add_user_stmt->execute([$user_name, $hashed_password, $first_name, $last_name, $role])) {
                $user_success = 'User added successfully!';
            } else {
                $user_error = 'Error adding user.';
            }
        }
    }
}

// Fetch categories for the dropdown
$categories_stmt = $pdo->query("SELECT * FROM categories ORDER BY order_number ASC");
$categories = $categories_stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch users for the list
$users_stmt = $pdo->query("SELECT user_name, first_name, last_name, role FROM users");
$users = $users_stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div style="padding: 20px;">
    <h2>Add Article</h2>
    <?php if ($error): ?>
        <p style="color:red;"><?php echo htmlspecialchars($error); ?></p>
    <?php endif; ?>
    <form action="admin.php" method="post"> <!-- Updated action to point to this file -->
        <label for="title">Title:</label>
        <input type="text" name="title" id="title" value="<?php echo htmlspecialchars($title); ?>" required>

        <label for="text">Content:</label>
        <textarea name="text" id="text" required><?php echo htmlspecialchars($text); ?></textarea>

        <label for="category_id">Category:</label>
        <select name="category_id" id="category_id" required>
            <?php foreach ($categories as $category): ?>
                <option value="<?php echo $category['category_id']; ?>" <?php echo $category['category_id'] == $category_id ? 'selected' : ''; ?>>
                    <?php echo htmlspecialchars($category['name']); ?>
                </option>
            <?php endforeach; ?>
        </select>

        <label for="author">Author:</label>
        <input type="text" name="author" id="author" value="<?php echo htmlspecialchars($author); ?>" required>

        <button type="submit">Add Article</button>
    </form>
</div>

<div style="padding: 20px; margin-top: 40px;">
    <h2>Add New User</h2>
    <?php if ($user_error): ?>
        <p style="color:red;"><?php echo htmlspecialchars($user_error); ?></p>
    <?php endif; ?>
    <?php if ($user_success): ?>
        <p style="color:green;"><?php echo htmlspecialchars($user_success); ?></p>
    <?php endif; ?>
    <form action="admin.php" method="post">
        <label for="user_name">Username:</label>
        <input type="text" name="user_name" id="user_name" required>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required>

        <label for="first_name">First Name:</label>
        <input type="text" name="first_name" id="first_name" required>

        <label for="last_name">Last Name:</label>
        <input type="text" name="last_name" id="last_name" required>

        <label for="role">Role:</label>
        <select name="role" id="role" required>
            <option value="Community manager">Community Manager</option>
            <option value="Editor">Editor</option>
            <option value="Admin">Admin</option>
        </select>

        <button type="submit" name="add_user">Add User</button>
    </form>
</div>

<div style="padding: 20px; margin-top: 40px;">
    <h2>Existing Users</h2>
    <table border="1" cellpadding="10">
        <thead>
            <tr>
                <th>Username</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Role</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($users as $user): ?>
                <tr>
                    <td><?php echo htmlspecialchars($user['user_name']); ?></td>
                    <td><?php echo htmlspecialchars($user['first_name']); ?></td>
                    <td><?php echo htmlspecialchars($user['last_name']); ?></td>
                    <td><?php echo htmlspecialchars($user['role']); ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

<?php include 'footer.php'; ?>

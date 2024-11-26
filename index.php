<?php include 'header.php'; ?>
<?php include 'db.php'; // Include database connection ?>

<main class="container">
    <!-- Categories Section -->
    <section class="categories">
        
        <div class="category-grid">
            <?php
            // Fetch categories from the database
            $stmt = $pdo->query("SELECT * FROM categories"); // From 'categories' table
            while ($category = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo '<div class="category-box"><a href="categories.php?category_id=' . $category['category_id'] . '">' . htmlspecialchars($category['name']) . '</a></div>';
            }
            ?>
        </div>
    </section>

    <!-- Latest Articles Section -->
    <section class="latest-articles">
        <h2>Latest Articles</h2>
        <ul>
            <?php
            // Fetch latest articles from the database
            $latest_articles_stmt = $pdo->query("SELECT * FROM articles ORDER BY publish_date DESC LIMIT 4"); // From 'articles' table
            while ($article = $latest_articles_stmt->fetch(PDO::FETCH_ASSOC)) {
                echo '<li><a href="articles.php?id=' . $article['article_id'] . '">' . htmlspecialchars($article['title']) . '</a></li>';
            }
            ?>
        </ul>
    </section>
</main>

<?php include 'footer.php'; ?>
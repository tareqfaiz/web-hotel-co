<?php
include 'header.php';
include 'db.php';

if (isset($_GET['category_id'])) {
    // Fetch category name
    $cat_stmt = $pdo->prepare("SELECT name FROM categories WHERE category_id = ?");
    $cat_stmt->execute([$_GET['category_id']]);
    $category = $cat_stmt->fetch(PDO::FETCH_ASSOC);
    
    // Fetch articles belonging to that category
    $stmt = $pdo->prepare("SELECT * FROM articles WHERE category_id = ?");
    $stmt->execute([$_GET['category_id']]);
    $articles = $stmt->fetchAll(PDO::FETCH_ASSOC);
} else {
    echo '<p>No category ID provided.</p>';
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web Hotel Co - Support Articles</title>
    <style>
   /* General Styles */
   body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
      color: #333;
   }

   .main {
      padding: 10px 5px 10px 5px;
   }

   /* Main Content */
   .content {
      display: flex;
      padding: 10px 20px 10px 20px;
      gap: 20px;
      align-items: flex-start;
   }

   /* Support Section */

   .support-section {
      flex: 3;
   }

   .article-box {
      flex: 3;
      border: 2px solid black;
      padding: 20px;
      
   }

   .article-box h3 {
      font-size: 18px;
      margin-bottom: 10px;
   }

   .article-box p {
      font-size: 14px;
      margin-bottom: 10px;
   }

   .article-box a {
      color: blue;
      text-decoration: underline;
   }

   /* Latest Articles */
      .latest-articles {
        flex: 1;
        min-height: 400px;
        padding: 5px 20px 20px 20px;
        border: 2px solid black;
        border-radius: 5px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .latest-articles h2 {
            margin-top: 0; /* Remove top margin for the heading */
        }

        .latest-articles ul {
        list-style-type: none;
        padding: 0;
        }

        .latest-articles li {
        margin: 10px 0;
        }

   </style>
</head>
<body>
    <main class="content">
        <!-- Support Articles Section -->
        <div class="support-section">
            <h2 class="main">Support Articles: <?php if (isset($category)) { echo htmlspecialchars($category['name']); } ?></h2>
            <?php if (!empty($articles)): ?>
                <?php foreach ($articles as $article): ?>
                    <div class="article-box">
                        <h3><?php echo htmlspecialchars($article['title']); ?></h3>
                        <p><?php echo nl2br(htmlspecialchars($article['text'])); ?></p>
                        <a href="articles.php?id=<?php echo $article['article_id']; ?>">Read article</a>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <p>No articles found in this category.</p>
            <?php endif; ?>
        </div>

        <!-- Latest Articles Section -->
        <aside class="latest-articles">
            <h2>Latest Articles</h2>
            <ul>
                <?php
                // Fetch latest articles and display in sidebar
                $latest_articles_stmt = $pdo->query("SELECT * FROM articles ORDER BY publish_date DESC LIMIT 4");
                while ($article = $latest_articles_stmt->fetch(PDO::FETCH_ASSOC)) {
                    echo '<li><a href="articles.php?id=' . $article['article_id'] . '">' . htmlspecialchars($article['title']) . '</a></li>';
                }
                ?>
            </ul>
        </aside>
    </main>
    
    <?php include 'footer.php'; ?>
</body>
</html>
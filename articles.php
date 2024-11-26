<?php
include 'header.php';
include 'db.php';

if (isset($_GET['id'])) {
    $stmt = $pdo->prepare("SELECT * FROM articles WHERE article_id = ?");
    $stmt->execute([$_GET['id']]);
    $article = $stmt->fetch(PDO::FETCH_ASSOC);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo isset($article) ? htmlspecialchars($article['title']) : 'Articles'; ?></title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

       

        /* Main Content */
        .content {
            display: flex;
            padding: 10px;
            gap: 20px;
        }

        /* Article Section */
        .article-section {
            flex: 3;
            padding: 5px;
           
        }

        .article-section h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .article-section .meta {
            font-size: 14px;
            color: #777;
            margin-bottom: 15px;
        }

        /* Latest Articles */
        .latest-articles {
        flex: 1;
        min-height: 400px;
        padding: 20px;
        border: 2px solid black;
        border-radius: 5px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
    <div class="container">
        <!-- Main Section -->
        <div class="content">
            <!-- Article Section -->
            <div class="article-section">
                <?php if ($article): ?>
                    <h2><?php echo htmlspecialchars($article['title']); ?></h2>
                    <p class="meta">Created <?php echo htmlspecialchars($article['publish_date']); ?> | By <?php echo htmlspecialchars($article['author']); ?></p>
                    <p><?php echo nl2br(htmlspecialchars($article['text'])); ?></p>
                <?php else: ?>
                    <p>Article not found.</p>
                <?php endif; ?>
            </div>

            <!-- Latest Articles Section -->
            <aside class="latest-articles">
                <h2>Latest Articles</h2>
                <ul>
                    <?php
                    // Fetch and display latest articles
                    $latest_articles_stmt = $pdo->query("SELECT * FROM articles ORDER BY publish_date DESC LIMIT 4");
                    while ($article = $latest_articles_stmt->fetch(PDO::FETCH_ASSOC)) {
                        echo '<li><a href="articles.php?id=' . $article['article_id'] . '">' . htmlspecialchars($article['title']) . '</a></li>';
                    }
                    ?>
                </ul>
            </aside>
        </div>
    </div>
    <?php include 'footer.php'; ?>
</body>
</html>
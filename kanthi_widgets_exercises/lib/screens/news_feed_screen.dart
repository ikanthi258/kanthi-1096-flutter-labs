import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../utils/responsive.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ArticleModel> articles = const [
      ArticleModel(
        title: 'Introduction to Flutter',
        description: 'Learn the basics of Flutter development...',
        date: '2024-01-05',
        readingTimeMinutes: 5,
      ),
      ArticleModel(
        title: 'Advanced Widget Patterns',
        description: 'Discover advanced patterns in Flutter...',
        date: '2024-01-04',
        readingTimeMinutes: 8,
      ),
      ArticleModel(
        title: 'State Management in Flutter',
        description: 'Explore different state management approaches...',
        date: '2024-01-03',
        readingTimeMinutes: 12,
      ),
      ArticleModel(
        title: 'Building Responsive UIs',
        description: 'Create apps that work on any screen size...',
        date: '2024-01-02',
        readingTimeMinutes: 10,
      ),
    ];

    Widget _buildArticleCard(ArticleModel article) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Important for GridView!
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                article.description,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    article.date,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    '${article.readingTimeMinutes} min read',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    GridView _buildGridView(int columnCount) {
      return GridView.builder(
        padding: Responsive.getGridPadding(context),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 16 / 9, // Adjust based on card content
        ),
        itemCount: articles.length,
        itemBuilder: (context, index) => _buildArticleCard(articles[index]),
      );
    }

    ListView _buildListView() {
      return ListView.builder(
        padding: Responsive.getScreenPadding(context),
        itemCount: articles.length,
        itemBuilder: (context, index) => _buildArticleCard(articles[index]),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columnCount = Responsive.getColumnCount(width);

        if (Responsive.isMobileFromWidth(width)) {
          return _buildListView();
        } else {
          return _buildGridView(columnCount);
        }
      },
    );
  }
}

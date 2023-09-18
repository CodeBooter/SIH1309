import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../app_state.dart';
import '../../utils/Dimensions.dart';
import '../../utils/colors.dart';

class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String content; // Add content
  final String publishedAt; // Add published date

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.content,
    required this.publishedAt,
  });
}

Future<List<NewsArticle>> fetchNewsArticles() async {
  final apiKey = 'da352f99a10252432fd580edc79cb1d8';
  final url =
      'https://gnews.io/api/v4/search?country=in&token=$apiKey&q=wool OR woolen OR sheep OR fabric';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic>? articles = data['articles'];

      if (articles != null) {
        return articles
            .map((article) => NewsArticle(
                  title: article['title'] ?? '',
                  description: article['description'] ?? '',
                  url: article['url'] ?? '',
                  imageUrl: article['image'] ?? '',
                  content: article['content'] ?? '', // Add content
                  publishedAt:
                      article['publishedAt'] ?? '', // Add published date
                ))
            .toList();
      } else {
        throw Exception('No articles found');
      }
    } else {
      throw Exception('Failed to load news articles');
    }
  } catch (e) {
    throw Exception('Error fetching news articles: $e');
  }
}

class NewsApi extends StatelessWidget {
  const NewsApi({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsArticle>>(
      future: fetchNewsArticles(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the data is loading, show a loading indicator
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // If there's an error, display an error message
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          // If data is successfully loaded, display the ListView
          final articles = snapshot.data;

          if (articles != null) {
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Card(
                  color: Colors.white,
                  elevation: 6,
                  child: ListTile(
                    title: Text(
                      article.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: Dimension.font16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    textColor: Colors.black,
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Published At: ${DateFormat('yyyy-MM-dd').format(DateTime.parse(article.publishedAt))}',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    leading: article.imageUrl.isNotEmpty
                        ? Image.network(
                            article.imageUrl,
                            width: 100,
                            height: 110,
                            fit: BoxFit.cover,
                          )
                        : SizedBox(
                            width: 100,
                            height: 110,
                            child: Center(
                              child: Text('No Image'),
                            ),
                          ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ArticlePage(
                            titleText: article.title,
                            imageUrl: article.imageUrl,
                            content:
                                article.content, // Pass content to ArticlePage
                            publishedAt: article
                                .publishedAt, // Pass published date to ArticlePage
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No articles found'));
          }
        }
      },
    );
  }
}

// article page open on tap
class ArticlePage extends StatelessWidget {
  final String titleText;
  final String imageUrl;
  final String content;
  final String publishedAt;
  const ArticlePage({
    Key? key,
    required this.titleText,
    required this.imageUrl,
    required this.content,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      backgroundColor: appState.isDarkMode
          ? AppColors.primaryColor
          : AppColors.lightModePrimary,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: appState.isDarkMode
            ? AppColors.primaryColor
            : AppColors.lightModePrimary,
        iconTheme: IconThemeData(
          color: appState.isDarkMode ? Colors.white : Colors.black,
        ),
        toolbarHeight: Dimension.val70,
        centerTitle: true,
        title: Text(
          titleText,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'poppins',
            fontSize: Dimension.font20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Article Image
              if (imageUrl.isNotEmpty)
                Image.network(
                  imageUrl,
                  width: double.infinity, // Full-width image
                  height: 200, // You can adjust the height
                  fit: BoxFit.cover,
                ),
              SizedBox(height: 16),

              Text(
                'Published on: $publishedAt',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),

              // Article Content
              Text(
                content,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              SizedBox(height: 16),

              // Published Date
            ],
          ),
        ),
      ),
    );
  }
}

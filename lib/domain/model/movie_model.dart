class MovieResponse {
  String? id;
  List<String>? director;
  List<String>? writers;
  List<String>? stars;
  int? releasedDate;
  List<String>? productionCompany;
  String? title;
  String? language;
  int? runTime;
  String? genre;
  List<Vote>? voted;
  String? poster;
  int? pageViews;
  String? description;
  List<String>? upVoted;
  List<String>? downVoted;
  int? totalVoted;
  int? voting;

  MovieResponse({
    this.id,
    this.director,
    this.writers,
    this.stars,
    this.releasedDate,
    this.productionCompany,
    this.title,
    this.language,
    this.runTime,
    this.genre,
    this.voted,
    this.poster,
    this.pageViews,
    this.description,
    this.upVoted,
    this.downVoted,
    this.totalVoted,
    this.voting,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      id: json['_id'],
      director: (json['director'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      writers:
          (json['writers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      stars:
          (json['stars'] as List<dynamic>?)?.map((e) => e as String).toList(),
      releasedDate: json['releasedDate'],
      productionCompany: (json['productionCompany'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      title: json['title'],
      language: json['language'],
      runTime: json['runTime'],
      genre: json['genre'],
      voted: (json['voted'] as List<dynamic>?)
          ?.map((e) => Vote.fromJson(e as Map<String, dynamic>))
          .toList(),
      poster: json['poster'],
      pageViews: json['pageViews'],
      description: json['description'],
      upVoted:
          (json['upVoted'] as List<dynamic>?)?.map((e) => e as String).toList(),
      downVoted: (json['downVoted'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      totalVoted: json['totalVoted'],
      voting: json['voting'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'director': director,
      'writers': writers,
      'stars': stars,
      'releasedDate': releasedDate,
      'productionCompany': productionCompany,
      'title': title,
      'language': language,
      'runTime': runTime,
      'genre': genre,
      'voted': voted?.map((e) => e.toJson()).toList(),
      'poster': poster,
      'pageViews': pageViews,
      'description': description,
      'upVoted': upVoted,
      'downVoted': downVoted,
      'totalVoted': totalVoted,
      'voting': voting,
    };
  }
}

class Vote {
  List<String>? upVoted;
  List<String>? downVoted;
  String? id;
  int? updatedAt;
  String? genre;

  Vote({
    this.upVoted,
    this.downVoted,
    this.id,
    this.updatedAt,
    this.genre,
  });

  factory Vote.fromJson(Map<String, dynamic> json) {
    return Vote(
      upVoted:
          (json['upVoted'] as List<dynamic>?)?.map((e) => e as String).toList(),
      downVoted: (json['downVoted'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['_id'],
      updatedAt: json['updatedAt'],
      genre: json['genre'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'upVoted': upVoted,
      'downVoted': downVoted,
      '_id': id,
      'updatedAt': updatedAt,
      'genre': genre,
    };
  }
}
